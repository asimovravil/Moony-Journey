//
//  SettingsViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = AppColor.green.uiColor
        label.font = UIFont(name: "Heebo-Bold", size: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var shareAppButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.shareApp.uiImage, for: .normal)
        return button
    }()
    
    private lazy var rateUsButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.rateUs.uiImage, for: .normal)
        return button
    }()
    
    private lazy var privacyPolicyButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.privacyPolicy.uiImage, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [backgroundView, settingsLabel, shareAppButton, rateUsButton, privacyPolicyButton].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        settingsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(66)
            make.leading.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().offset(-149)
        }
        shareAppButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(133)
            make.centerX.equalToSuperview()
            make.height.equalTo(74)
        }
        rateUsButton.snp.makeConstraints { make in
            make.top.equalTo(shareAppButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(74)
        }
        privacyPolicyButton.snp.makeConstraints { make in
            make.top.equalTo(rateUsButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(74)
        }
    }
}
