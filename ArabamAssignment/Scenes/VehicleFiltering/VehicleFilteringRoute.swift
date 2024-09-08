// 
//  VehicleFilteringRoute.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

protocol VehicleFilteringRoute {
    func presentVehicleFiltering()
}

extension VehicleFilteringRoute where Self: RouterProtocol {

    func presentVehicleFiltering() {
        let router = VehicleFilteringRouter()
        let viewModel = VehicleFilteringViewModel(router: router)
        let viewController = VehicleFilteringViewController(viewModel: viewModel)
        let transition = ModalTransition(modalPresentationStyle: .popover)
        router.viewController = viewController
        router.openTransition = transition

        open(viewController, transition: transition)
    }
}
