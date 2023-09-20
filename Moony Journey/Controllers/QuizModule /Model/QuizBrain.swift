//
//  QuizBrain.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "What is Earth's natural satellite?", a: ["Mars", "Moon", "Sun", "Venus"], correctAnswer: "Moon"),
        Question(q: "Which planet is known as 'The Red Planet'?", a: ["Mars", "Saturn", "Venus", "Jupiter"], correctAnswer: "Mars"),
        Question(q: "What is the closest planet to the Sun?", a: ["Earth", "Venus", "Mercury", "Mars"], correctAnswer: "Mercury"),
        Question(q: "The big, bright object in the night sky?", a: ["Comets", "Stars", "Sun", "Moon"], correctAnswer: "Moon"),
        Question(q: "Which planet is known for its beautiful rings?", a: ["Jupiter", "Mars", "Saturn", "Uranus"], correctAnswer: "Saturn"),
        Question(q: "What's the largest planet in our solar system?", a: ["Saturn", "Mars", "Jupiter", "Earth"], correctAnswer: "Jupiter"),
        Question(q: "What's the center of our solar system?", a: ["Mars", "Moon", "Sun", "Venus"], correctAnswer: "Sun"),
        Question(q: "What is the study of stars and planets called?", a: ["Chemistry", "Biology", "Astronomy", "Geology"], correctAnswer: "Astronomy"),
        Question(q: "What spacecraft landed on the Moon in 1969?", a: ["Yuri-1", "Apollo-11", "Sputnik-1", "Voskhod-2"], correctAnswer: "Apollo-11"),
        Question(q: "What causes the Northern Lights in the sky?", a: ["Rain", "Snow", "Thunderstorms", "Solar activity"], correctAnswer: "Solar activity")
    ]


    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}

