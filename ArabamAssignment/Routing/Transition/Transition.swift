//
//  Transition.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
