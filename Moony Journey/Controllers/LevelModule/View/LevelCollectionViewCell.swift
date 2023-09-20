//
//  LevelCollectionViewCell.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class LevelCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private lazy var levelClosedButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.levelClosed.uiImage, for: .normal)
        return button
    }()
    
    static let reuseID = String(describing: LevelCollectionViewCell.self)
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupViews
    
    private func setupViews() {
        [levelClosedButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        levelClosedButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
