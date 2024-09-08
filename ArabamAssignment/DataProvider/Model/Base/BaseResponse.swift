//
//  BaseResponse.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public struct BaseResponse<T: Decodable>: Decodable {
    public let code: String?
    public let title: String?
    public let message: String?
    public let data: T?
}
