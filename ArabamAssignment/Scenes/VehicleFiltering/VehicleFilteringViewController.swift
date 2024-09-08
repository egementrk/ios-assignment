// 
//  VehicleFilteringViewController.swift
//  ArabamAssignment
//
//  Created by Egemen TÜRK on 8.09.2024.
//

import UIKit

protocol VehicleFilteringViewControllerDelegate: AnyObject {
    func didApplyFilters(minDate: String?, maxDate: String?, sortType: Int, sortDirection: Int)
}

final class VehicleFilteringViewController: BaseViewController<VehicleFilteringViewModel> {
    
    weak var delegate: VehicleFilteringViewControllerDelegate?
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let minDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Min Year (YYYY)"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let maxDateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Max Year (YYYY)"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let sortTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Price", "Date", "Year"])
        segmentedControl.selectedSegmentIndex = 2
        return segmentedControl
    }()
    
    private let sortDirectionSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Ascending", "Descending"])
        segmentedControl.selectedSegmentIndex = 1
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
    }
}

// MARK: - UILayout
extension VehicleFilteringViewController {
    
    private func addSubviews() {
        addStackView()
    }
    
    private func addStackView() {
        view.addSubview(contentStackView)
        contentStackView.centerInSuperview()
        contentStackView.horizontalToSuperview(insets: .horizontal(16))
        contentStackView.addArrangedSubview(minDateTextField)
        contentStackView.addArrangedSubview(maxDateTextField)
        contentStackView.addArrangedSubview(sortTypeSegmentedControl)
        contentStackView.addArrangedSubview(sortDirectionSegmentedControl)
    }
}

// MARK: - ConfigureContents
extension VehicleFilteringViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Apply", style: .done, target: self, action: #selector(applyFilters))
    }
}

// MARK: - Actions
extension VehicleFilteringViewController {
    
    @objc
    private func applyFilters() {
        let minYear = minDateTextField.text
        let maxYear = maxDateTextField.text
        let minDate: String?
        let maxDate: String?
        // I didn't see any indication that it could be nil values.
        guard let minYear,
              let maxYear else { return }
        if !minYear.isEmpty {
            minDate = "\(minYear)-01-01"
        } else {
            minDate = nil
        }
        
        if !maxYear.isEmpty {
            maxDate = "\(maxYear)-12-31"
        } else {
            maxDate = nil
        }
        
        let sortType = sortTypeSegmentedControl.selectedSegmentIndex
        let sortDirection = sortDirectionSegmentedControl.selectedSegmentIndex
        
        delegate?.didApplyFilters(minDate: minDate, maxDate: maxDate, sortType: sortType, sortDirection: sortDirection)
        dismiss(animated: true, completion: nil)
    }
}
