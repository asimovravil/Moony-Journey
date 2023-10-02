//
//  QuizTableViewCell.swift
//  Moony Journey
//
//  Created by Ravil on 02.10.2023.
//

import UIKit
import SnapKit

final class QuizTableViewCell: UITableViewCell {

    static let reuseID = String(describing: QuizTableViewCell.self)
    var quizBrain = QuizBrain()
    private var answerSelected = false
    var userCorrectAnswers = 0
    weak var navigationController: UINavigationController?

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
    
    private lazy var firstAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.firstAnswer.uiImage, for: .normal)
        button.setTitle("Jupiter", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var secondAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.secondAnswer.uiImage, for: .normal)
        button.setTitle("Saturn", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.thirdAnswer.uiImage, for: .normal)
        button.setTitle("Earth", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var fourthAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.fourthAnswer.uiImage, for: .normal)
        button.setTitle("Neptune", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return button
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [countLabel, questionLabel, questionImage, firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton, quitQuizButton, nextQuizButton].forEach() {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        countLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
        }
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(questionImage.snp.top).offset(-16)
        }
        questionImage.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        firstAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(questionImage.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(60)
            make.width.equalTo(342)
        }
        secondAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(firstAnswerButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(60)
            make.width.equalTo(342)
        }
        thirdAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(secondAnswerButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(60)
            make.width.equalTo(342)
        }
        fourthAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(thirdAnswerButton.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(36)
            make.height.equalTo(60)
            make.width.equalTo(342)
        }
        quitQuizButton.snp.makeConstraints { make in
            make.top.equalTo(fourthAnswerButton.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(24)
            make.height.equalTo(49)
        }
        nextQuizButton.snp.makeConstraints { make in
            make.top.equalTo(fourthAnswerButton.snp.bottom).offset(28)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(49)
        }
    }
    
    // MARK: - Actions
    
    @objc private func quitQuizButtonTapped() {
        let controller = TabBarController()
        controller.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func nextQuizButtonTapped() {
        quizBrain.nextQuestion()
        
        if quizBrain.questionNumber == 0 {
            showResultViewController()
        } else {
            updateUI()
        }
    }
    
    @objc public func updateUI() {
        let questionText = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        questionLabel.text = questionText
        firstAnswerButton.setTitle(answers[0], for: .normal)
        secondAnswerButton.setTitle(answers[1], for: .normal)
        thirdAnswerButton.setTitle(answers[2], for: .normal)
        fourthAnswerButton.setTitle(answers[3], for: .normal)
        
        countLabel.text = "\(quizBrain.questionNumber + 1)/\(quizBrain.quiz.count)"
        
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
        fourthAnswerButton.backgroundColor = UIColor.clear
        
        answerSelected = false
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!

            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = AppColor.green.uiColor
                userCorrectAnswers += 10
            } else {
                sender.backgroundColor = AppColor.red.uiColor
            }

            sender.layer.cornerRadius = 10

            answerSelected = true
        }
    }
    
    private func showResultViewController() {
        let resultViewController = ResultViewController()
        resultViewController.userCorrectAnswers = userCorrectAnswers
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}

