//
//  ReusableView.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
