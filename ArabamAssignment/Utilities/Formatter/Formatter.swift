//
//  Formatter.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 4.09.2024.
//

import Foundation

final class FormatterUtility {
    
    static let shared = FormatterUtility()
    
    private init() {}
    
    // Generic Component
    func format<T>(value: T, formatType: FormatType) -> String? {
        switch formatType {
        case .currency(let currencyCode):
            if let amount = value as? Double {
                return formatCurrency(amount: amount, currencyCode: currencyCode)
            }
        case .kilometers:
            if let kilometers = value as? Int {
                return formatKilometers(kilometers: kilometers)
            }
        case .location:
            if let location = value as? Location {
                return formatVehicleLocation(location)
            }
        case .breadcrumb:
            if let string = value as? String {
                return formatBreadcrumb(string)
            }
        }
        return nil
    }
    
    private func formatCurrency(amount: Double, currencyCode: String = "TL") -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "tr_TR")
        
        if let formattedAmount = formatter.string(from: NSNumber(value: amount)) {
            return "\(formattedAmount) \(currencyCode)"
        }
        return nil
    }

    private func formatKilometers(kilometers: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.locale = Locale(identifier: "tr_TR")
        if let formattedKilometers = formatter.string(from: NSNumber(value: kilometers)) {
            return "\(formattedKilometers) km"
        }
        return "\(kilometers) km"
    }
    
    private func formatVehicleLocation(_ location: Location?) -> String {
        let cityName = location?.cityName
        let townName = location?.townName
        if let vehicleLocation = cityName?.buildLocationString(townName) {
            return vehicleLocation
        } else {
            return "undefined"
        }
    }
    
    private func formatBreadcrumb(_ breadcrumb: String?) -> String? {
        guard let breadcrumb = breadcrumb else { return nil }
        let components = breadcrumb.split(separator: "/")
        return components.joined(separator: " > ")
    }
}

enum FormatType {
    case currency(currencyCode: String)
    case kilometers
    case location
    case breadcrumb
}
