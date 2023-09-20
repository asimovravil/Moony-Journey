//
//  MainViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var groupRocketImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.groupRocket.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var startQuizButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.startQuizButton.uiImage, for: .normal)
        button.addTarget(self, action: #selector(startQuizButtonTapped), for: .touchUpInside)
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
        [backgroundView, groupRocketImage, startQuizButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        groupRocketImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        startQuizButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-173)
            make.height.equalTo(83)
        }
    }
    
    // MARK: - Actions
    
    @objc private func startQuizButtonTapped() {
        let controller = LevelViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

