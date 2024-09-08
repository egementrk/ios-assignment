//
//  RequestProtocol.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

public typealias RequestParameters = [String: Any]
public typealias RequestHeaders = [String: String]

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
