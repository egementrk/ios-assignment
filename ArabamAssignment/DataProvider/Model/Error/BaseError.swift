//
//  BaseError.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

import Foundation

public enum BaseErrorCode: String {
    case unknown
}

extension BaseErrorCode: Codable {
    
    public init(from decoder: Decoder) throws {
        self = try BaseErrorCode(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

public struct BaseErrorResponse: Codable, Error, LocalizedError {
    public let code: BaseErrorCode?
    public let message: String?
    public let title: String?
    
    public var errorDescription: String? {
        return message
    }
}
