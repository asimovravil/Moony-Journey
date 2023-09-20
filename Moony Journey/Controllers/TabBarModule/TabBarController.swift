//
//  TabBarController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    // MARK: - setupTabBar
    
    private func setupTabBar() {
        let mainViewController = MainViewController()
        let settingsViewController = LevelViewController()
        
        let backgroundImage = UIImage(named: "background")
        self.tabBar.backgroundImage = backgroundImage

        mainViewController.tabBarItem = UITabBarItem(
            title: "", image: AppImage.homeTabInactive.uiImage,
            selectedImage: AppImage.homeTabActive.uiImage
        )
        
        settingsViewController.tabBarItem = UITabBarItem(
            title: "", image: AppImage.settingsTabInactive.uiImage,
            selectedImage: AppImage.settingsTabActive.uiImage
        )
        viewControllers = [mainViewController, settingsViewController]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysTemplate)
        return viewController
    }
}
