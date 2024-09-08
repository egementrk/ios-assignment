// 
//  VehicleDetailViewController.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 5.09.2024.
//

import UIKit
import Kingfisher

final class VehicleDetailViewController: BaseViewController<VehicleDetailViewModel> {
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(.remove, for: .normal)
        button.size(CGSize(width: 32, height: 32))
        button.tintColor = .appRed
       return button
    }()
    
    private let vehicleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let breadcrumbLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .appRed
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .appTitle
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let locationImageView: UIImageView = {
        let image = UIImageView()
        image.image = .location
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.textColor = .appRed
        label.numberOfLines = 0
        return label
    }()
    
    private let propertiesCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .appBackground
        collectionView.register(PropertiesCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let callButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Call", for: .normal)
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    
    private let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Message", for: .normal)
        button.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        button.tintColor = .appTitle
        button.backgroundColor = .appGray
        button.setTitleColor(.appTitle, for: .normal)
        button.layer.cornerRadius = 8
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .appBackground
        addSubviews()
        configureContents()
        viewModel.didLoad()
        subscribeViewModel()
    }
}

// MARK: - UILayout
extension VehicleDetailViewController {
 
    private func addSubviews() {
        addVehicleImageView()
        addNavigationButton()
        addBreadcrumbLabel()
        addTitleLabel()
        addLocationImageView()
        addLocationTitleLabel()
        addPriceTitleLabel()
        addPropertiesCollectionView()
        addContactButtons()
    }
    
    private func addNavigationButton() {
        view.addSubview(backButton)
        backButton.leadingToSuperview(offset: 16)
        backButton.topToSuperview(usingSafeArea: true)
    }
    
    private func addVehicleImageView() {
        view.addSubview(vehicleImageView)
        vehicleImageView.edgesToSuperview(excluding: .bottom)
        vehicleImageView.height(UIScreen.main.bounds.height * 0.3)
        vehicleImageView.width(UIScreen.main.bounds.width)
    }
    
    private func addBreadcrumbLabel() {
        view.addSubview(breadcrumbLabel)
        breadcrumbLabel.topToBottom(of: vehicleImageView, offset: 8)
        breadcrumbLabel.horizontalToSuperview(insets: .horizontal(16))
        
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topToBottom(of: breadcrumbLabel, offset: 16)
        titleLabel.horizontalToSuperview(insets: .horizontal(16))
    }
    
    private func addLocationImageView() {
        view.addSubview(locationImageView)
        locationImageView.topToBottom(of: titleLabel, offset: 8)
        locationImageView.leadingToSuperview(offset: 10)
        locationImageView.size(CGSize(width: 24, height: 24))
    }
    
    private func addLocationTitleLabel() {
        view.addSubview(locationTitleLabel)
        locationTitleLabel.centerY(to: locationImageView)
        locationTitleLabel.leadingToTrailing(of: locationImageView, offset: 4)
    }
    
    private func addPriceTitleLabel() {
        view.addSubview(priceTitleLabel)
        priceTitleLabel.topToBottom(of: locationTitleLabel, offset: 8)
        priceTitleLabel.horizontalToSuperview(insets: .horizontal(16))
    }
    
    
    private func addPropertiesCollectionView() {
        view.addSubview(propertiesCollectionView)
        propertiesCollectionView.topToBottom(of: priceTitleLabel, offset: 12)
        propertiesCollectionView.horizontalToSuperview()
        propertiesCollectionView.bottom(to: view)
    }
    
    private func addContactButtons() {
        view.addSubview(callButton)
        callButton.bottomToSuperview(offset: -16)
        callButton.leadingToSuperview(offset: 16)
        callButton.height(50)
        callButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8).isActive = true
        
        view.addSubview(messageButton)
        messageButton.bottomToSuperview(offset: -16)
        messageButton.trailingToSuperview(offset: -16)
        messageButton.height(50)
        messageButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8).isActive = true
    }
}

// MARK: - Configure
extension VehicleDetailViewController {
    
    private func configureContents() {
        propertiesCollectionView.delegate = self
        propertiesCollectionView.dataSource = self        
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }
}

// MARK: - SubscribeViewModel
extension VehicleDetailViewController {
    
    private func subscribeViewModel() {
        viewModel.didSuccessFetchVehicle = { [weak self] in
            guard let self else { return }
            guard let vehicle = viewModel.vehicle else { return }
            // FIXME: - Backend image problem; image is not coming from backend
            vehicleImageView.kf.setImage(with: URL(string: "https://static.wikia.nocookie.net/p__/images/b/b6/Mater_at_his_junkyard.jpg/revision/latest?cb=20150918002314&path-prefix=protagonist"))
            breadcrumbLabel.text = FormatterUtility.shared.format(value: vehicle.category?.name, formatType: .breadcrumb)
            titleLabel.text = vehicle.title
            locationTitleLabel.text = FormatterUtility.shared.format(value: vehicle.location, formatType: .location)
            priceTitleLabel.text = FormatterUtility.shared.format(value: Double(vehicle.price ?? 0), formatType: .currency(currencyCode: "TL"))
            propertiesCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension VehicleDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PropertiesCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VehicleDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
}


// MARK: - Actions
extension VehicleDetailViewController {
    
    @objc
    private func tappedBackButton() {
        viewModel.tappedBackButton()
    }
}
