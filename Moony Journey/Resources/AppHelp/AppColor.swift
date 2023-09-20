//
//  AppColor.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import Foundation
import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        guard let color = UIColor.init(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case backgroundColor
    case white
    case green
    case red
    case gradientFirstMain
    case gradientSecMain
}
