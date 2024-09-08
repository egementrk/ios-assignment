//
//  BaseViewController.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController,
                                                    BaseViewController.LoadingProtocols {
    
    typealias LoadingProtocols = LoadingProtocol & ActivityIndicatorProtocol
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeLoading()
        subscribeActivityIndicator()
    }
    
    func setupBackButton(withColor color: UIColor? = nil) {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(customBackButtonTapped))
        
        if let color = color {
            backButton.tintColor = color
        }
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func subscribeActivityIndicator() {
        viewModel.showActivityIndicatorView = { [weak self] in
            self?.showActivityIndicator()
        }
        viewModel.hideActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
        }
    }
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            self?.presentLoading()
        }
        viewModel.hideLoading = { [weak self] in
            self?.dismissLoading()
        }
    }
    
    @objc
    func customBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
}
