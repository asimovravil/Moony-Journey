//
//  StructedSettings.swift
//  Moony Journey
//
//  Created by Mikha on 29.09.2023.
//

import UIKit

struct StructedSettings {
    let privacyPolicy: URL
    let termOfUse: URL
    
    let sumChecked: Bool
    
    
    init(
        privacyPolicy: URL,
        termOfUse: URL = URL(string: "https://maps.app.goo.gl/UFBbhNL8Hi5MhLdr7?g_st=it")!,
        sumChecked: Bool
    ) {
        self.privacyPolicy = privacyPolicy
        self.termOfUse = termOfUse
        self.sumChecked = sumChecked
    }
}

enum StructedManager {
    
    static func createView(viewModel: StructedSettings) -> UIViewController {
        let view = ReselectedViewController(viewModel: viewModel)
        view.modalPresentationStyle = .fullScreen
        return view
    }
    
    static func createPrivacyView() -> UIViewController {
        let viewModel = StructedSettings(
            privacyPolicy: RequestResponseManager.shared.privacyPolicy,
            sumChecked: false
        )
        return ReselectedViewController(viewModel: viewModel)
    }
    
}
