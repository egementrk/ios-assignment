//
//  LoadingProtocol.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 6.09.2024.
//

import IHProgressHUD
import UIKit

public protocol LoadingProtocol {
    func presentLoading()
    func dismissLoading()
}

public extension LoadingProtocol where Self: UIViewController {
    
    func presentLoading() {
        IHProgressHUD.set(backgroundColor: .black.withAlphaComponent(0.2))
        IHProgressHUD.show()
    }
    
    func dismissLoading() {
        IHProgressHUD.dismiss()
    }
}
