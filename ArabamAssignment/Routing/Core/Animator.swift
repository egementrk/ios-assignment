//
//  Animator.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
