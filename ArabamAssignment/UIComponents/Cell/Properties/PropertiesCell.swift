// 
//  PropertiesCell.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

import UIKit

public class PropertiesCell: UICollectionViewCell, ReusableView {
    
    private let propertyTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .appSubTitle
        label.numberOfLines = 0
        return label
    }()
    
    private let propertyValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .appTitle
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()

    weak var viewModel: PropertiesCellProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureContents()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
        configureContents()
    }
    
    public func set(viewModel: PropertiesCellProtocol) {
        self.viewModel = viewModel
        propertyTitleLabel.text = viewModel.name
        propertyValueLabel.text = viewModel.value
    }
    
    private func configureContents() {}
}


// MARK: - UILayout
extension PropertiesCell {
    
    private func addSubviews() {
        addPropertyTitleLabel()
        addPropertyValueLabel()
    }
    
    private func addPropertyTitleLabel() {
        contentView.addSubview(propertyTitleLabel)
        propertyTitleLabel.centerYToSuperview()
        propertyTitleLabel.leadingToSuperview(offset: 12)
    }
    
    private func addPropertyValueLabel() {
        contentView.addSubview(propertyValueLabel)
        propertyValueLabel.centerYToSuperview()
        propertyValueLabel.trailingToSuperview(offset: 12)
    }
}
