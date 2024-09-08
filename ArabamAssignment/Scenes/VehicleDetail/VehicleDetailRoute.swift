// 
//  VehicleDetailRoute.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 5.09.2024.
//

protocol VehicleDetailRoute {
    func presentVehicleDetail(vehicleID: Int)
}

extension VehicleDetailRoute where Self: RouterProtocol {

    func presentVehicleDetail(vehicleID: Int) {
        let router = VehicleDetailRouter()
        let viewModel = VehicleDetailViewModel(router: router, vehicleID)
        let viewController = VehicleDetailViewController(viewModel: viewModel)

        let transition = ModalTransition(modalPresentationStyle: .fullScreen)
        router.viewController = viewController
        router.openTransition = transition

        open(viewController, transition: transition)
    }
}
