//
//  HintViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class HintViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var planetsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.planets.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var jetImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.jet.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        let alpha: CGFloat = 0.6
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose any planet and receive a chance to get a hint - the correct answer to the current question. This chance is given once per level. Good luck!"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "Heebo-Regular", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var startHintButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.startHint.uiImage, for: .normal)
        button.addTarget(self, action: #selector(startHintButtonTapped), for: .touchUpInside)
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
        [backgroundView, planetsImage, jetImage, titleView, titleLabel, startHintButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        planetsImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(78)
            make.leading.equalToSuperview().offset(263)
        }
        jetImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(510)
            make.trailing.equalToSuperview().offset(-269)
        }
        titleView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(188)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.top).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        startHintButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: AppImage.closeHint.uiImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func startHintButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.titleView.alpha = 0
            self.titleLabel.alpha = 0
            self.startHintButton.alpha = 0
        } completion: { (_) in
            self.titleView.isHidden = true
            self.titleLabel.isHidden = true
            self.startHintButton.isHidden = true
            self.titleView.alpha = 1
            self.titleLabel.alpha = 1
            self.startHintButton.alpha = 1
        }
    }
}
