//
//  QuizViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class QuizViewController: UIViewController {

    var quizBrain = QuizBrain()
    private var answerSelected = false
    
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
    
    private lazy var firstAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.firstAnswer.uiImage, for: .normal)
        button.setTitle("Jupiter", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.secondAnswer.uiImage, for: .normal)
        button.setTitle("Saturn", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var thirdAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.thirdAnswer.uiImage, for: .normal)
        button.setTitle("Earth", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var fourthAnswerButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.fourthAnswer.uiImage, for: .normal)
        button.setTitle("Neptune", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "Heebo-Bold", size: 24)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupNavigationBar()
        updateUI()
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [countLabel, questionLabel, questionImage, quitQuizButton, nextQuizButton, firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton].forEach() {
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
            make.bottom.equalTo(questionImage.snp.top).offset(-16)
        }
        questionImage.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        firstAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(questionImage.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(36)
        }
        secondAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(firstAnswerButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(36)
        }
        thirdAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(secondAnswerButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(36)
        }
        fourthAnswerButton.snp.makeConstraints { make in
            make.top.equalTo(thirdAnswerButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(36)
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
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func nextQuizButtonTapped() {
        quizBrain.nextQuestion()
        
        if quizBrain.questionNumber == 0 {
            showResultViewController()
        } else {
            updateUI()
        }
    }
    
    @objc private func answerButtonTapped(_ sender: UIButton) {
        if !answerSelected {
            let userAnswer = sender.currentTitle!

            let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

            if userGotItRight {
                sender.backgroundColor = AppColor.green.uiColor
            } else {
                sender.backgroundColor = AppColor.red.uiColor
            }

            sender.layer.cornerRadius = 10

            answerSelected = true
        }
    }
    
    private func showResultViewController() {
        let resultViewController = ResultViewController()
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    @objc private func updateUI() {
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
}
