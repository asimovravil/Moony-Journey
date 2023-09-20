//
//  ResultViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class ResultViewController: UIViewController {

    // MARK: - UI
    
    private lazy var totalCorrectLabel: UILabel = {
        let label = UILabel()
        label.text = "Total correct answers"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "Heebo-Regular", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "6 out of 10 Questions"
        label.textColor = AppColor.green.uiColor
        label.font = UIFont(name: "Heebo-Medium", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.tryAgain.uiImage, for: .normal)
        button.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [totalCorrectLabel, amountLabel, tryAgainButton].forEach() {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.backgroundColor.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        totalCorrectLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.leading.equalToSuperview().offset(24)
        }
        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(totalCorrectLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
        }
        tryAgainButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-87)
            make.height.equalTo(83)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: AppImage.backNavigationButton.uiImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Results"
        titleLabel.font = UIFont(name: "Heebo-Bold", size: 24)
        titleLabel.textColor = AppColor.green.uiColor
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Actions
    
    @objc private func tryAgainButtonTapped() {
        let controller = MainViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
