//
//  VehicleDetail.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

public struct VehicleDetail: Codable {
    public let id: Int
    public let title: String?
    public let location: Location?
    public let category: Category?
    public let modelName: String?
    public let price: Int?
    public let priceFormatted: String?
    public let date: String?
    public let dateFormatted: String?
    public let photo: [String]?
    public let properties: [Property]?
    public let text: String?
    public let userInfo: UserInfo?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case location
        case category
        case modelName
        case price
        case priceFormatted
        case date
        case dateFormatted
        case photo
        case properties
        case text
        case userInfo
    }
}
