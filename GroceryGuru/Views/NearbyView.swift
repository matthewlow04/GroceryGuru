//
//  NearbyView.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-05.
//

import SwiftUI
import MapKit
import CoreLocationUI
import CoreLocation

struct NearbyView: View {
    @State private var locationResponse: LocationResponse?
    @EnvironmentObject var locationManager: LocationManager
    @State var showingPopover = false
    @State var currentIndex = 0
    @State var currentLocation = ""
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Local Grocery Stores")
                    .modifier(TitleModifier())
                if let response = locationResponse {
                    Text("\(response.results[0].name!)")
                    VStack(alignment: .leading){
                        Text("\(response.results[0].vicinity!)")
                        Text("Distance: \(calculateDistanceBetween(coordinate1: CLLocationCoordinate2D(latitude: locationManager.location.latitude, longitude: locationManager.location.longitude), coordinate2: CLLocationCoordinate2D(latitude: response.results[0].geometry!.location.lat!, longitude: response.results[0].geometry!.location.lng!)))")
                        Text("Rating: \(String(format: "%.2f", response.results[0].rating!.rounded(toDecimalPlaces: 2)))")
                        
                    }
                    .onTapGesture {
                        currentIndex = 0
                        currentLocation = response.results[0].name!
                        showingPopover = true
                        
                    }
                    
                    .font(Font.system(size: 13, weight: .semibold, design:.rounded))
                    .opacity(0.5)
                    
                  
              
                    Text("\(response.results[1].name!)")
                    VStack(alignment: .leading){
                        Text("\(response.results[1].vicinity!)")
                        Text("Distance: \(calculateDistanceBetween(coordinate1: CLLocationCoordinate2D(latitude: locationManager.location.latitude, longitude: locationManager.location.longitude), coordinate2: CLLocationCoordinate2D(latitude: response.results[1].geometry!.location.lat!, longitude: response.results[1].geometry!.location.lng!)))")
                        Text("Rating: \(String(format: "%.2f", response.results[1].rating!.rounded(toDecimalPlaces: 2)))")
                    }
                    .onTapGesture {
                        currentIndex = 1
                        currentLocation = response.results[1].name!
                        showingPopover = true
                    }
                    .font(Font.system(size: 13, weight: .semibold, design:.rounded))
                    .opacity(0.5)
                    
       
                } else {
                    Text("Loading...")
                }
        
                
            }
            Spacer()
        }
        .popover(isPresented: $showingPopover, content: {
            Map{
                Marker(currentLocation, coordinate: CLLocationCoordinate2D(latitude: locationResponse!.results[currentIndex].geometry!.location.lat!, longitude: locationResponse!.results[currentIndex].geometry!.location.lng!))
                    .tint(.orange)
                Marker("Home", coordinate: CLLocationCoordinate2D(latitude: locationManager.location.latitude, longitude: locationManager.location.longitude))
                    .tint(.red)
                    
            }.frame(width: 300, height: 300)
            .presentationCompactAdaptation((.popover))
        })
        .padding(.all, 20)
        .onAppear{
            Task {
                do {
                    locationResponse = try await locationManager.fetchLocation()
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
        }
   
    }
    func calculateDistanceBetween(coordinate1: CLLocationCoordinate2D, coordinate2: CLLocationCoordinate2D) -> String {
        let location1 = CLLocation(latitude: coordinate1.latitude, longitude: coordinate1.longitude)
        let location2 = CLLocation(latitude: coordinate2.latitude, longitude: coordinate2.longitude)

        let distance = location1.distance(from: location2)/1000
        return String(format: "%.2f", distance.rounded(toDecimalPlaces: 2)) + " km"
        
    }
}

#Preview {
    NearbyView()
}
