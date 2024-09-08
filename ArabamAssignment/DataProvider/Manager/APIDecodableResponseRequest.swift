//
//  APIDecodableResponseRequest.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public protocol ArabamRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension ArabamRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - URL
public extension ArabamRequest {
    var url: String {
        return arabamApiUrl + path
    }
}

// MARK: - RequestParameters
public extension ArabamRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension ArabamRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
