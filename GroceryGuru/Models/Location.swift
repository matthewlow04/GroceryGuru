//
//  Location.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-05.
//

import Foundation

struct LocationResponse: Codable{
    let htmlAttributions: [String]?
    let results: [LocationResult]
    let status: String
}

struct LocationResult: Codable {
    let businessStatus: String?
    let geometry: LocationGeometry?
    let icon: String?
    let iconBackgroundColor: String?
    let iconMaskBaseURI: String?
    let name: String?
    let openingHours: LocationOpeningHours?
    let photos: [LocationPhoto]?
    let placeID: String?
    let plusCode: LocationPlusCode?
    let priceLevel: Int?
    let rating: Double?
    let reference: String?
    let scope: String?
    let types: [String]?
    let userRatingsTotal: Int?
    let vicinity: String?
}

struct LocationGeometry: Codable {
    let location: Location
    let viewport: LocationViewport
}

struct Location: Codable {
    let lat: Double?
    let lng: Double?
}

struct LocationViewport: Codable {
    let northeast: Location
    let southwest: Location
}

struct LocationOpeningHours: Codable {
    let openNow: Bool?
}

struct LocationPhoto: Codable {
    let height: Int?
    let htmlAttributions: [String]?
    let photoReference: String?
    let width: Int?
}

struct LocationPlusCode: Codable {
    let compoundCode: String?
    let globalCode: String?
}
