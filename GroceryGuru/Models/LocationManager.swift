//
//  LocationManager.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-05.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location = CLLocationCoordinate2D(latitude: 43.894660, longitude: -79.374350)
    var locationManager: CLLocationManager!

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first!.coordinate
    }
    
    func fetchLocation() async throws -> LocationResponse {
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location.latitude ?? 43.894660 ),\(location.longitude ?? -79.374350)&radius=5000&keyword=grocery&key=AIzaSyDxcng7Fba-UVGoes36l260nOJStPZwIGY")!

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(LocationResponse.self, from: data)

        return decoded
    }
    
        
   

}
