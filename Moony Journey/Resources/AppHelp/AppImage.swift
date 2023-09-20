//
//  AppImage.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import Foundation
import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    
    // MARK: - Main
    
    case backNavigationButton
    case questionButton
    case groupRocket
    case startQuizButton
    
    // MARK: - Level
    
    case levelOpen
    case levelClosed
    
    // MARK: - TabBar
    
    case homeTabActive
    case homeTabInactive
    case settingsTabActive
    case settingsTabInactive
    
    // MARK: - Quiz
    
    case question
    case quitQuiz
    case nextQuiz
    case firstAnswer
    case secondAnswer
    case thirdAnswer
    case fourthAnswer
    
    // MARK: - Hint
    
    case planets
    case jet
    case closeHint
    case startHint
    
    // MARK: - Results
    
    case tryAgain
    case finalScore
    
    // MARK: - Settings
    
    case shareApp
    case privacyPolicy
    case rateUs
    
    
    // MARK: - Background
    
    case background
    
}
