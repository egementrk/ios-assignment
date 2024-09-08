//
//  VehicleListingViewModel.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import Foundation

protocol VehicleListingViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(indexPath: IndexPath) -> VehicleCellProtocol
}

protocol VehicleListingViewEventSource {
    var didSuccessGetVehicleList: VoidClosure? { get set }
    
    func viewDidLoad()
    func loadMoreVehicles()
    func didSelectItemAt(indexPath: IndexPath)
    func applySearchFilters(minDate: String?, maxDate: String?, sortType: Int, sortDirection: Int)
}

protocol VehicleListingViewProtocol: VehicleListingViewDataSource, VehicleListingViewEventSource {}

final class VehicleListingViewModel: BaseViewModel<VehicleListingRouter>, VehicleListingViewProtocol {
    
    // Event Source
    var didSuccessGetVehicleList: VoidClosure?
    var didFailToGetVehicleList: ((Error) -> Void)?
    
    // Privates
    private var cellItems: [VehicleCellProtocol] = []
    private var currentPage: Int = 0
    private var isLoading: Bool = false
    private var hasMoreData: Bool = true
    private var minDate: String?
    private var maxDate: String?
    private var categoryId: Int?
    private var sortType: Int = 2
    private var sortDirection: Int = 1
    private var isFiltering: Bool = false
    
    func viewDidLoad() {
        getVehicleList()
    }
    
    func loadMoreVehicles() {
        guard !isLoading && hasMoreData && !isFiltering else { return }
        currentPage += 1
        getVehicleList()
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let vehicleID = cellItems[indexPath.row].id
        router.presentVehicleDetail(vehicleID: vehicleID)
    }
}

// MARK: - Data Source
extension VehicleListingViewModel {
    
    func numberOfItemsAt() -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> VehicleCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Network
extension VehicleListingViewModel {
    
    private func getVehicleList() {
        isLoading = true
        let request = VehicleListingRequest(page: currentPage, minDate: minDate, maxDate: maxDate, categoryId: categoryId, sortType: sortType, sortDirection: sortDirection)
        dataProvider.request(for: request) { [weak self] result in
            guard let self else { return }
            self.isLoading = false
            self.isFiltering = false
            switch result {
            case .success(let data):
                self.cellItems.removeAll()
                if data.isEmpty == true {
                    self.hasMoreData = false
                } else {
                    self.cellItems.append(contentsOf: data.map { VehicleCellModel($0) })
                }
                self.didSuccessGetVehicleList?()
            case .failure(let error):
                self.didFailToGetVehicleList?(error)
            }
        }
    }
    
}

// MARK: - Filter
extension VehicleListingViewModel {
    
    func applySearchFilters(minDate: String?, maxDate: String?, sortType: Int, sortDirection: Int) {
        self.minDate = minDate
        self.maxDate = maxDate
        self.sortType = sortType
        self.sortDirection = sortDirection
        currentPage = 0
        cellItems.removeAll()
        isFiltering = true
        hasMoreData = true
        getVehicleList()
    }
}
