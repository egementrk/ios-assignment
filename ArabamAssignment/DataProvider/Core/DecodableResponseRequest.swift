//
//  DecodableResponseRequest.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}

