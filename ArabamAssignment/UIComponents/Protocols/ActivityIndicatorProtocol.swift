//
//  ActivityIndicatorProtocol.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 6.09.2024.
//

import UIKit
import TinyConstraints

public protocol ActivityIndicatorProtocol: AnyObject {
    func showActivityIndicator()
    func hideActivityIndicator()
}

public extension ActivityIndicatorProtocol where Self: UIViewController {
    
    func showActivityIndicator() {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.tintColor = .gray
        indicator.startAnimating()
        view.addSubview(indicator)
        indicator.centerInSuperview()
        view.bringSubviewToFront(indicator)
    }
    
    func hideActivityIndicator() {
        view.subviews.filter({ $0 is UIActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
}
