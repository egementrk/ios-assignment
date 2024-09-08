//
//  String+Extensions.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 3.09.2024.
//

public extension String {
    
    func buildLocationString(_ townName: String?) -> String {
        if let townName {
            return self + "," + townName
        } else {
            return self
        }
    }
}
