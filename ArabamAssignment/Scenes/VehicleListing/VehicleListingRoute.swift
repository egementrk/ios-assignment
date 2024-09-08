// 
//  VehicleListingRoute.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

protocol VehicleListingRoute {
    func placeOnWindowVehicleListing()
}

extension VehicleListingRoute where Self: RouterProtocol {

    func placeOnWindowVehicleListing() {
        let router = VehicleListingRouter()
        let viewModel = VehicleListingViewModel(router: router)
        let viewController = VehicleListingViewController(viewModel: viewModel)

        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition

        open(viewController, transition: transition)
    }
}
