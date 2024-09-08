//
//  AppRouter.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = VehicleListingRoute
    
    static let shared = AppRouter()
    
    var window: UIWindow?
    
    func startApp() {
        placeOnWindowVehicleListing()
    }
    
    func startApp(window: UIWindow?, dataProvider: DataProviderProtocol) {
        self.window = window
        
        let router = VehicleListingRouter()
        let viewModel = VehicleListingViewModel(router: router, dataProvider: dataProvider)
        let viewController = VehicleListingViewController(viewModel: viewModel)
        router.viewController = viewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
}
