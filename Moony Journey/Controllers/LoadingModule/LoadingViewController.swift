//
//  LoadingViewController.swift
//  Moony Journey
//
//  Created by Ravil on 22.09.2023.
//

import UIKit
import SnapKit
import WebKit

final class LoadingViewController: UIViewController {
    
    
    private var viewModel: StructedSettings!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let cachedViewModel = SavedSettingsManager.cachedViewModel {
            let vc = StructedManager.createView(viewModel: cachedViewModel)
            self.present(vc, animated: true)
        } else {
            takeMeToTheChurch()
        }
    }
    
    func takeMeToTheChurch() {
        RequestResponseManager.shared.getGames(
            success: handleSuccessGetGames,
            failure: showAlertWithOoooopsError
        )
    }
    
    func handleSuccessGetGames(_ viewModel: StructedSettings) {
        self.viewModel = viewModel
        print("------")
        print(viewModel)
        print("------")
        if viewModel.sumChecked {
            let vc = StructedManager.createView(viewModel: viewModel)
            self.present(vc, animated: true)
        } else {
            let mainViewController = TabBarController()
            let navigationController = UINavigationController(rootViewController: mainViewController)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: false)
        }
    }
    
    
    func showAlertWithOoooopsError() {
        let alertController = UIAlertController(
            title: "Ooops!",
            message: "Error",
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "Retry",
                style: .default,
                handler: { _ in
                    self.takeMeToTheChurch()
                }
            ))
        present(
            alertController,
            animated: true,
            completion: nil
        )
    }
    
    
}



