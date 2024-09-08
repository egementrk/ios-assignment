// 
//  VehicleListingRouter.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

final class VehicleListingRouter: Router, VehicleListingRouter.Routes {
    typealias Routes = VehicleDetailRoute & VehicleFilteringRoute
}
