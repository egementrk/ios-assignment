//
//  VehicleCellModel.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import Foundation

public protocol VehicleCellDataSource: AnyObject {
    var id: Int { get }
    var title: String? { get }
    var location: Location? { get }
    var category: Category? { get }
    var modelName: String? { get }
    var price: Int? { get }
    var priceFormatted: String? { get }
    var date: String? { get }
    var dateFormatted: String? { get }
    var photo: String? { get }
    var properties: [Property]? { get }
}

public protocol VehicleCellEventSource: AnyObject {
    
}

public protocol VehicleCellProtocol: VehicleCellDataSource, VehicleCellEventSource {
    func formatPropertiesTitle () -> String
    
    var vehicleLocation: String? { get }
}

public final class VehicleCellModel: VehicleCellProtocol {
    
    public var id: Int
    public var title: String?
    public var location: Location?
    public var category: Category?
    public var modelName: String?
    public var price: Int?
    public var priceFormatted: String?
    public var date: String?
    public var dateFormatted: String?
    public var photo: String?
    public var properties: [Property]?
    public var vehicleLocation: String?
    
    public init(id: Int, title: String? = nil, location: Location? = nil, category: Category? = nil, modelName: String? = nil, price: Int? = nil, priceFormatted: String? = nil,
                date: String? = nil, dateFormatted: String? = nil, photo: String? = nil, properties: [Property]? = nil) {
        self.id = id
        self.title = title
        self.location = location
        self.category = category
        self.modelName = modelName
        self.price = price
        self.priceFormatted = formatPriceTitle(price)
        self.date = date
        self.dateFormatted = dateFormatted
        self.photo = photo
        self.properties = properties
        self.vehicleLocation = FormatterUtility.shared.format(value: location, formatType: .location)
        
    }
    
    
    public func formatPropertiesTitle() -> String {
        guard let properties else { return "" }
        let dot = " \u{00B7} "
        var propertArr: [String] = []
        for property in properties {
            if let value = property.value, value != "" , let name = property.name {
                name == "km" ? propertArr.append(formatKilometer()) : propertArr.append(value)
            }
        }
        return propertArr.joined(separator: dot)
    }
    
    func formatPriceTitle(_ price: Int?) -> String {
        guard let price else { return "" }
        let formattedPrice = FormatterUtility.shared.format(value: Double(price), formatType: .currency(currencyCode: "TL")) ?? "- TL"
        return formattedPrice
    }
    
    func formatKilometer() -> String {
        guard let kilometer = properties?.first(where: {$0.name == "km"})?.value else { return "- km"}
        let formattedKilometer = FormatterUtility.shared.format(value: Int(kilometer), formatType: .kilometers) ?? "- km"
        return formattedKilometer
    }
    
}

