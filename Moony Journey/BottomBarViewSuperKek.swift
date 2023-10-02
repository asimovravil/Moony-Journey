//
//  ToolbarView.swift
//  Moony Journey
//
//  Created by Mikha on 29.09.2023.
//

import UIKit
import SnapKit

protocol BootomBarSuperKekDelegate: AnyObject {
    func pop()
    func popToRoot()
}

final class BottomBarViewSuperKek: UIView {
    
    weak var delegate: BootomBarSuperKekDelegate?
    
    
    @objc func popImageViewTapped() { delegate?.pop() }
    
    @objc func rootImageViewTapped() { delegate?.popToRoot() }
    
    private let popImageView = UIImageView()
    private let rootImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        сonfigureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        сonfigureAppearance()
    }
    
    private func сonfigureAppearance() {
        backgroundColor = .black
        configurePopImageView()
        configureRootImageView()
    }
    
    private func configurePopImageView() {
        addSubview(popImageView)
        popImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popImageViewTapped)))
        popImageView.image = UIImage(named: "pop")
        popImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(32)
        }
    }
    
    private func configureRootImageView() {
        addSubview(rootImageView)
        rootImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rootImageViewTapped)))
        rootImageView.image = UIImage(named: "root")
        rootImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.right.equalToSuperview().inset(32)
        }
    }
    
}
