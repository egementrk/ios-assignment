// 
//  VehicleFilteringViewModel.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

import Foundation


protocol VehicleFilteringViewDataSource {}

protocol VehicleFilteringViewEventSource {}

protocol VehicleFilteringViewProtocol: VehicleFilteringViewDataSource, VehicleFilteringViewEventSource {}

final class VehicleFilteringViewModel: BaseViewModel<VehicleFilteringRouter>, VehicleFilteringViewProtocol {}
