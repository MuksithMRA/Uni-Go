import SwiftUI

struct PlaceDetailPopup: View {
    var place: Place
    @Environment(\.presentationMode) var presentationMode
    @State private var isFavorite: Bool = false
    @State private var estimatedTime: String = "Calculating..."
    @EnvironmentObject var mapViewModel: MapViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            
            VStack(spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image(place.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .clipped()
                        .cornerRadius(16, corners: [.topLeft, .topRight])
                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .white)
                            .padding(8)
                            .background(Circle().fill(Color.white.opacity(0.7)))
                    }
                    .padding(16)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(place.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.blue)
                            Text(place.floor)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "ruler")
                                .foregroundColor(.blue)
                            Text("\(place.distance) meters away")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.blue)
                            Text(estimatedTime)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Divider()
                    
                    if !place.crowdLevel.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Crowd Level")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack {
                                Text(place.crowdLevel)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(crowdLevelColor)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(crowdLevelColor.opacity(0.1))
                                    .cornerRadius(8)
                                
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Crowd Trend Today")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                CrowdLevelGraph(crowdLevel: place.crowdLevel)
                                    .frame(height: 100)
                                    .padding(.vertical, 8)
                            }
                        }
                        
                        Divider()
                    }
                    
                    if !place.startTime.isEmpty && !place.date.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Schedule")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Date")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(place.date)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Time")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(place.startTime)
                                        .font(.subheadline)
                                        .fontWeight(.medium)
                                }
                            }
                        }
                        
                        Divider()
                    }
                    
                    Button(action: {
                        mapViewModel.navigateToPlace(place)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "location.fill")
                            Text("Navigate")
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.blue)
                        .cornerRadius(12)
                    }
                }
                .padding(20)
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 24)
            .frame(maxWidth: 360)
            .frame(maxHeight: UIScreen.main.bounds.height * 0.8)
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        }
        .onAppear {
            calculateEstimatedTime()
        }
    }
    
    private var crowdLevelColor: Color {
        switch place.crowdLevel {
        case "Very Crowded":
            return .red
        case "Crowded":
            return .orange
        case "Moderate":
            return .yellow
        case "Not Crowded":
            return .green
        default:
            return .blue
        }
    }
    
    private func calculateEstimatedTime() {
        mapViewModel.getEstimatedTravelTime(to: place) { time in
            if let time = time {
                let minutes = Int(time / 60)
                DispatchQueue.main.async {
                    estimatedTime = "\(minutes) min walk"
                }
            } else {
                DispatchQueue.main.async {
                    estimatedTime = "Unknown"
                }
            }
        }
    }
}

struct CrowdLevelGraph: View {
    var crowdLevel: String
    
    private var sampleData: [CGFloat] {
        switch crowdLevel {
        case "Very Crowded":
            return [0.3, 0.5, 0.7, 0.8, 0.9, 1.0, 0.95]
        case "Crowded":
            return [0.2, 0.4, 0.6, 0.7, 0.8, 0.75, 0.7]
        case "Moderate":
            return [0.3, 0.4, 0.5, 0.55, 0.5, 0.45, 0.4]
        case "Not Crowded":
            return [0.1, 0.2, 0.25, 0.3, 0.2, 0.15, 0.1]
        default:
            return [0.3, 0.4, 0.5, 0.4, 0.3, 0.4, 0.5]
        }
    }
    
    private var timeLabels: [String] {
        return ["8AM", "10AM", "12PM", "2PM", "4PM", "6PM", "8PM"]
    }
    
    private var graphColor: Color {
        switch crowdLevel {
        case "Very Crowded":
            return .red
        case "Crowded":
            return .orange
        case "Moderate":
            return .yellow
        case "Not Crowded":
            return .green
        default:
            return .blue
        }
    }
    
    private var currentTimeIndex: Int {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 9 { return 0 }
        else if hour < 11 { return 1 }
        else if hour < 13 { return 2 }
        else if hour < 15 { return 3 }
        else if hour < 17 { return 4 }
        else if hour < 19 { return 5 }
        else { return 6 }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .leading) {
                VStack(spacing: 0) {
                    ForEach(0..<4) { i in
                        Divider()
                            .background(Color.gray.opacity(0.3))
                            .padding(.bottom, 20)
                    }
                }
                
                HStack(alignment: .bottom, spacing: 12) {
                    ForEach(0..<sampleData.count, id: \.self) { index in
                        VStack {
                            ZStack(alignment: .bottom) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(graphColor.opacity(0.8))
                                    .frame(width: 12, height: 70 * sampleData[index])
                                
                                if index == currentTimeIndex {
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(.blue)
                                        .offset(y: -15)
                                }
                            }
                            
                            Text(timeLabels[index])
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                                .padding(.top, 4)
                        }
                    }
                }
                .padding(.horizontal, 4)
                .padding(.top, 8)
            }
            
            HStack(spacing: 12) {
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    Text("Very Crowded")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 8, height: 8)
                    Text("Crowded")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 8, height: 8)
                    Text("Not Crowded")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct PlaceDetailPopup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            PlaceDetailPopup(
                place: Place(
                    name: "Harrison Hall",
                    floor: "Computing Faculty",
                    distance: 10,
                    crowdLevel: "Not Crowded",
                    startTime: "13:30",
                    date: "01/02/2025",
                    image: "lecHall_image"
                )
            )
            .environmentObject(MapViewModel())
        }
    }
}
