//
//  VehicleLocation.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public struct Location: Codable {
    public let cityName: String?
    public let townName: String?
    
    enum CodingKeys: String, CodingKey {
        case cityName 
        case townName
    }
}
