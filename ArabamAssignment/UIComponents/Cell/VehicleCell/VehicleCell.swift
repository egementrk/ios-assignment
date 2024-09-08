//
//  VehicleCell.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 2.09.2024.
//

import UIKit

public class VehicleCell: UICollectionViewCell, ReusableView {
    
    private let vehicleImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let vehicleTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .appTitle
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
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .appSubTitle
        return label
    }()
    
    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .red
        return label
    }()
    
    private let propertiesView: UIView = {
        let view = UIView()
        view.backgroundColor = .vehicleCellPropertiesBackground
        view.height(20)
        return view
    }()
    
    private let propertiesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .appSubTitle
        label.textAlignment = .left
        return label
    }()
    
    weak var viewModel: VehicleCellProtocol?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
    
    public func set(viewModel: VehicleCellProtocol) {
        self.viewModel = viewModel
        self.vehicleTitleLabel.text = viewModel.title
        self.locationTitleLabel.text = viewModel.vehicleLocation
        self.priceTitleLabel.text = viewModel.priceFormatted
        self.propertiesTitleLabel.text = viewModel.formatPropertiesTitle()
        
        if let photoUrl = viewModel.photo, let url = URL(string: photoUrl) {
            self.vehicleImageView.kf.setImage(with: url, placeholder: UIImage.arabamcomLogo)
        } else {
            self.vehicleImageView.image = .arabamcomLogo
        }
    }
}

// MARK: - UILayout
extension VehicleCell {
    
    private func addSubViews() {
        addVehicleImageView()
        addVehicleTitleLabel()
        addPropertiesView()
        addLocationImageView()
        addLocationTitleLabel()
        addPriceTitleLabel()
        addPropertiesView()
        addPropertiesTitleLabel()
    }
    
    private func addVehicleImageView() {
        contentView.addSubview(vehicleImageView)
        vehicleImageView.topToSuperview(offset: 10)
        vehicleImageView.leftToSuperview(offset: 5)
        vehicleImageView.size(.init(width: 100, height: 70))
    }
    
    private func addVehicleTitleLabel() {
        contentView.addSubview(vehicleTitleLabel)
        vehicleTitleLabel.leftToRight(of: vehicleImageView, offset: 5)
        vehicleTitleLabel.topToSuperview(offset: 12)
        vehicleTitleLabel.rightToSuperview(offset: -4)
    }
    
    private func addLocationImageView() {
        contentView.addSubview(locationImageView)
        locationImageView.left(to: vehicleTitleLabel)
        locationImageView.bottomToTop(of: propertiesView, offset: -10)
        locationImageView.size(.init(width: 20, height: 20))
    }
    
    private func addLocationTitleLabel() {
        contentView.addSubview(locationTitleLabel)
        locationTitleLabel.leftToRight(of: locationImageView, offset: 2)
        locationTitleLabel.centerY(to: locationImageView)
    }
    
    private func addPriceTitleLabel() {
        contentView.addSubview(priceTitleLabel)
        priceTitleLabel.right(to: vehicleTitleLabel)
        priceTitleLabel.bottom(to: locationImageView)
    }
    
    private func addPropertiesView() {
        contentView.addSubview(propertiesView)
        propertiesView.edgesToSuperview(excluding: .top)
        propertiesView.topToBottom(of: vehicleImageView, offset: 8)
    }
    
    private func addPropertiesTitleLabel() {
        propertiesView.addSubview(propertiesTitleLabel)
        propertiesTitleLabel.horizontalToSuperview(insets: .horizontal(4))
        propertiesTitleLabel.centerYToSuperview()
        
    }
}

// MARK: - Configure
extension VehicleCell {
    
    private func configureContents() {
        backgroundColor = .vehicleListCellBackground
    }
}
