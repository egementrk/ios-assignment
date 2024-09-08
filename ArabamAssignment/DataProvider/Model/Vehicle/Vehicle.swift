//
//  Vehicle.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public struct Vehicle: Codable {
    public let id: Int
    public let title: String?
    public let location: Location?
    public let category: Category?
    public let modelName: String?
    public let price: Int?
    public let priceFormatted: String?
    public let date: String?
    public let dateFormatted: String?
    public let photo: String?
    public let properties: [Property]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case location
        case category
        case modelName /*= "model_name"*/
        case price
        case priceFormatted /*= "price_formatted"*/
        case date
        case dateFormatted /*= "date_formatted"*/
        case photo
        case properties
    }
}
