//
//  VehicleDetailRequest.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

public struct VehicleDetailRequest: ArabamRequest {
    
    public typealias ResponseType = VehicleDetail
    
    public var path: String = "v1/detail"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(_ vehicleID: Int) {
        parameters["id"] = vehicleID
    }
}
