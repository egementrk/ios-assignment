//
//  VehicleListingViewController.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

final class VehicleListingViewController: BaseViewController<VehicleListingViewModel> {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .appBackground
        collectionView.register(VehicleCell.self)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLocalize()
        subscribeViewModel()
        configureContents()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension VehicleListingViewController {
    
    private func addSubviews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(usingSafeArea: true)
    }
    
}

// MARK: - Configure
extension VehicleListingViewController {
    
    private func configureContents() {
        view.backgroundColor = .appBackground
        configureNavigationController()
        configureCollectionView()
    }
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func configureNavigationController() {          
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(showFilterOptions))
        navigationItem.rightBarButtonItem = filterButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setLocalize() {
        navigationItem.title = "Vehicles"
    }
}

// MARK: - SubscribeViewModel
extension VehicleListingViewController {
    
    private func subscribeViewModel() {
        viewModel.didSuccessGetVehicleList = { [weak self] in
            guard let self else { return }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension VehicleListingViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VehicleCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VehicleListingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}

// MARK: - UIScrollViewDelegate
extension VehicleListingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            viewModel.loadMoreVehicles()
        }
    }
}

// MARK: - Actions
extension VehicleListingViewController {
    
    @objc
    private func showFilterOptions() {
        // FIXME: - routing
        let router = VehicleFilteringRouter()
        let viewModel = VehicleFilteringViewModel(router: router)
        let viewController = VehicleFilteringViewController(viewModel: viewModel)
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
    }
}

// MARK: - VehicleFilteringViewControllerDelegate
extension VehicleListingViewController: VehicleFilteringViewControllerDelegate {
    
    func didApplyFilters(minDate: String?, maxDate: String?, sortType: Int, sortDirection: Int) {
        viewModel.applySearchFilters(minDate: minDate, maxDate: maxDate, sortType: sortType, sortDirection: sortDirection)
    }
}
