//
//  QuizViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class QuizViewController: UIViewController {

    // MARK: - UI
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "01/10"
        label.textColor = AppColor.green.uiColor
        label.font = UIFont(name: "Heebo-Medium", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "What is the 6th planet in the Solar system?"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "Heebo-Regular", size: 28)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var questionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.question.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var quitQuizButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.quitQuiz.uiImage, for: .normal)
        button.addTarget(self, action: #selector(quitQuizButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextQuizButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.nextQuiz.uiImage, for: .normal)
        button.addTarget(self, action: #selector(nextQuizButtonTapped), for: .touchUpInside)
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
        [countLabel, questionLabel, questionImage, quitQuizButton, nextQuizButton].forEach() {
            view.addSubview($0)
        }
        view.backgroundColor = AppColor.backgroundColor.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(132)
            make.leading.equalToSuperview().offset(24)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        questionImage.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        quitQuizButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-43)
            make.height.equalTo(49)
        }
        nextQuizButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-43)
            make.height.equalTo(49)
        }
    }
    
    // MARK: - setupNavigationBar
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: AppImage.backNavigationButton.uiImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        let questionButton = UIBarButtonItem(image: AppImage.questionButton.uiImage, style: .plain, target: self, action: #selector(questionButtonTapped))
        navigationItem.rightBarButtonItem = questionButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Level 1"
        titleLabel.font = UIFont(name: "Heebo-Bold", size: 24)
        titleLabel.textColor = AppColor.green.uiColor
        titleLabel.sizeToFit()
        
        navigationItem.titleView = titleLabel
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func questionButtonTapped() {
        
    }
    
    // MARK: - Actions
    
    @objc private func quitQuizButtonTapped() {

    }
    
    @objc private func nextQuizButtonTapped() {

    }
}
