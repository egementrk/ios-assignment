//
//  DataProviderProtocol.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

public typealias DataProviderResult<T: Decodable> = ((Result<T, NetworkError>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
