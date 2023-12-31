//
//  SceneDelegate.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .dark
      
        window.rootViewController = LoadingViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}

