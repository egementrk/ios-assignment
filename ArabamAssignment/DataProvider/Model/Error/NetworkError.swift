//
//  NetworkError.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

import Foundation

public enum NetworkError: Error {
    
    case timeOut
    case noInternetConnection
    case baseError(Error)
    case common
    case serverError
}

public extension NetworkError {
    
    func getErrorCode() -> BaseErrorCode {
        switch self {
        case .baseError(let error):
            if let baseError = error as? BaseErrorResponse {
                return baseError.code ?? .unknown
            }
            return .unknown
        default:
            return .unknown
        }
    }
}
