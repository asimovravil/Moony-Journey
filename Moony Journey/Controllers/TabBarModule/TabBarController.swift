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
        let settingViewController = SettingsViewController()
        
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.isTranslucent = true
        
        let alpha: CGFloat = 0.6
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)

        mainViewController.tabBarItem = UITabBarItem(
            title: "", image: AppImage.homeTabInactive.uiImage,
            selectedImage: AppImage.homeTabActive.uiImage
        )
                
        settingViewController.tabBarItem = UITabBarItem(
            title: "", image: AppImage.settingsTabInactive.uiImage,
            selectedImage: AppImage.settingsTabActive.uiImage
        )
        viewControllers = [mainViewController, settingViewController]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image?.withRenderingMode(.alwaysTemplate)
        return viewController
    }
}
