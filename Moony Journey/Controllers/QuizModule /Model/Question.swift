//
//  Question.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import Foundation

struct Question {
    let text: String
    
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
