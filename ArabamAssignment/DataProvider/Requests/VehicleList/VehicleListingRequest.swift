//
//  VehicleListingRequest.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public struct VehicleListingRequest: ArabamRequest {
    
    public typealias ResponseType = [Vehicle]
    
    public var path: String = "v1/listing"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(page: Int, minDate: String? = nil, maxDate: String? = nil, categoryId: Int? = nil, sortType: Int, sortDirection: Int) {
        parameters["page"] = "\(page)"
        parameters["minDate"] = minDate
        parameters["maxDate"] = maxDate
        parameters["categoryId"] = categoryId
        parameters["sortType"] = sortType
        parameters["sortDirection"] = sortDirection
        // Pagination Number
        parameters["take"] = 10
    }
    
}
