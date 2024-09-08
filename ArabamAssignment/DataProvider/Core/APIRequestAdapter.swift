//
//  APIRequestAdapter.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

import Alamofire

struct APIRequestAdapter {
    
    let method: HTTPMethod
    let parameters: Parameters
    let headers: HTTPHeaders
    let encoding: ParameterEncoding
    let url: String
    
    init<T: RequestProtocol>(request: T) {
        self.method = request.method.toAlamofireHTTPMethod
        self.parameters = request.parameters
        var headers: HTTPHeaders = [:]
        request.headers.forEach({ headers[$0.key] = $0.value })
        self.headers = headers
        self.encoding = request.encoding.toAlamofireEncoding
        self.url = request.url
    }
    
}

extension RequestMethod {
    var toAlamofireHTTPMethod: HTTPMethod {
        switch self {
        case .connect: return .connect
        case .delete: return .delete
        case .get: return .get
        case .head: return .head
        case .options: return .options
        case .patch: return .patch
        case .post: return .post
        case .put: return .put
        case .trace: return .trace
        }
    }
}

extension RequestEncoding {
    var toAlamofireEncoding: ParameterEncoding {
        switch self {
        case .json: return URLEncoding.httpBody
        case .url: return URLEncoding.default
        }
    }
}
