//
//  VehicleCategory.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public struct Category: Codable {
    public let id: Int?
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
