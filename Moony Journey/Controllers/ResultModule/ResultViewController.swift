//
//  ResultViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class ResultViewController: UIViewController {

    var userCorrectAnswers: Int = 0
    
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
    
    private lazy var finalScoreImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.finalScore.uiImage
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var finalScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "60"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "Heebo-Black", size: 80)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.text = "%"
        label.textColor = AppColor.white.uiColor
        label.font = UIFont(name: "Heebo-Black", size: 34)
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
        calculateScore()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [totalCorrectLabel, amountLabel, finalScoreImage, tryAgainButton, finalScoreLabel, percentLabel].forEach() {
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
        finalScoreImage.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(43)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        finalScoreLabel.snp.makeConstraints { make in
            make.trailing.equalTo(percentLabel.snp.leading)
            make.bottom.equalTo(finalScoreImage.snp.bottom).offset(-89)
        }
        percentLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-131.5)
            make.bottom.equalTo(finalScoreImage.snp.bottom).offset(-109)
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
        let controller = TabBarController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func calculateScore() {
        let totalQuestions = 10
        finalScoreLabel.text = "\(userCorrectAnswers)"
        
        let scorePercentage = (Double(userCorrectAnswers) / Double(totalQuestions)) * 100.0
        
        amountLabel.text = "\(userCorrectAnswers)% out of \(totalQuestions) Questions"
    }
}
