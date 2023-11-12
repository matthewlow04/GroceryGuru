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
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
           let data = FileManager.default.contents(atPath: path) {
            do {
                if let plist = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                    if let apiKey = plist["api-key"] as? String {
                        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(location.latitude ),\(location.longitude )&radius=5000&keyword=grocery&key=\(apiKey)")!

                        let (data, _) = try await URLSession.shared.data(from: url)

                        let decoded = try JSONDecoder().decode(LocationResponse.self, from: data)

                        return decoded
                    } else {
                        print("API Key not found in plist")
                    }
                }
            } catch {
                print("Error reading plist: \(error)")
            }
        } else {
            print("Error accessing plist file")
        }
       
        throw fatalError()
     
    }
    
        
   

}
