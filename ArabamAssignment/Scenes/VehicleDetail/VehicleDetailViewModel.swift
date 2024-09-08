// 
//  VehicleDetailViewModel.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 5.09.2024.
//

import Foundation

protocol VehicleDetailViewDataSource {}

protocol VehicleDetailViewEventSource {
    var didSuccessFetchVehicle: VoidClosure? { get set }
}

protocol VehicleDetailViewProtocol: VehicleDetailViewDataSource, VehicleDetailViewEventSource {}

final class VehicleDetailViewModel: BaseViewModel<VehicleDetailRouter>, VehicleDetailViewProtocol {
    
    // EventSource
    public var didSuccessFetchVehicle: VoidClosure?
    
    // Privates
    private var vehicleID: Int?
    private var cellItems: [PropertiesCellProtocol] = []
    
    //Public
    var vehicle: VehicleDetail?
    
    func didLoad() {
        guard let vehicleID else { return }
        getVehicleDetail(vehicleID)
    }
    
    init(router: VehicleDetailRouter, _ vehicleID: Int) {
        super.init(router: router)
        self.vehicleID = vehicleID
    }
}

// MARK: - DataProvider
extension VehicleDetailViewModel {
    
    func getVehicleDetail(_ id: Int) {
        showLoading?()
        let request = VehicleDetailRequest(id)
        dataProvider.request(for: request, result: { [weak self] result in
            guard let self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.vehicle = response
                self.cellItems.append(contentsOf: ((vehicle?.properties?.map({PropertiesCellModel(property: $0)}))!))
                didSuccessFetchVehicle?()
            case .failure(let error):
                print(error)
            }
        })
    }
}

// MARK: - DataSource
extension VehicleDetailViewModel {
    
    func numberOfItemsAt() -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> PropertiesCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Actions
extension VehicleDetailViewModel {
    
    func tappedBackButton() {
        router.close()
    }
}
