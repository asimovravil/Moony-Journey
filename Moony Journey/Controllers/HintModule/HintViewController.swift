//
//  HintViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class HintViewController: UIViewController {

    private var jetImageTopConstraint: Constraint?
    private var jetImageTrailingConstraint: Constraint?
    private var hintButtonTapped = false
    
    // MARK: - UI
    
    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.background.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var earthButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.earth.uiImage, for: .normal)
        button.addTarget(self, action: #selector(earthButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var saturnButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.saturn.uiImage, for: .normal)
        button.addTarget(self, action: #selector(saturnButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var marsButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.mars.uiImage, for: .normal)
        button.addTarget(self, action: #selector(marsButtonTapped), for: .touchUpInside)
        return button
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
        [backgroundView, earthButton, saturnButton, marsButton, jetImage, titleView, titleLabel, startHintButton].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        earthButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(78)
            make.leading.equalToSuperview().offset(334)
        }
        saturnButton.snp.makeConstraints { make in
            make.top.equalTo(earthButton.snp.bottom).offset(105)
            make.leading.equalToSuperview().offset(283)
        }
        marsButton.snp.makeConstraints { make in
            make.top.equalTo(saturnButton.snp.bottom).offset(105)
            make.leading.equalToSuperview().offset(336)
        }
        jetImage.snp.makeConstraints { make in
            jetImageTopConstraint = make.top.equalToSuperview().offset(510).constraint
            jetImageTrailingConstraint = make.trailing.equalToSuperview().offset(-269).constraint
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
            self.hintButtonTapped = true
        }
    }
    
    @objc private func earthButtonTapped() {
        if !hintButtonTapped {
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            self.jetImage.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(97)
                make.trailing.equalToSuperview().offset(-144)
            }
            self.view.layoutIfNeeded()
        } completion: { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.navigateToQuizViewController()
            }
        }
    }
    
    @objc private func saturnButtonTapped() {
        if !hintButtonTapped {
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            self.jetImage.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(358)
                make.trailing.equalToSuperview().offset(-144)
            }
            self.view.layoutIfNeeded()
        } completion: { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.navigateToQuizViewController()
            }
        }
    }
    
    @objc private func marsButtonTapped() {
        if !hintButtonTapped {
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            self.jetImage.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(589)
                make.trailing.equalToSuperview().offset(-144)
            }
            self.view.layoutIfNeeded()
        } completion: { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.navigateToQuizViewController()
            }
        }
    }

    private func navigateToQuizViewController() {
        let quizViewController = QuizViewController()
        self.navigationController?.pushViewController(quizViewController, animated: true)
    }
}
