// 
//  PropertiesCellModel.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

import Foundation

public protocol PropertiesCellDataSource: AnyObject {
    var name: String? { get }
    var value: String? { get }
}

public protocol PropertiesCellEventSource: AnyObject {

}

public protocol PropertiesCellProtocol: PropertiesCellDataSource, PropertiesCellEventSource {

}

public final class PropertiesCellModel: PropertiesCellProtocol {
    
    public var name: String?
    public var value: String?

    public init(property: Property) {
        self.name = property.name
        self.value = property.value
    }
}
