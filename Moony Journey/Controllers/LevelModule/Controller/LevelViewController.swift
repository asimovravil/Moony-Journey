//
//  LevelViewController.swift
//  Moony Journey
//
//  Created by Ravil on 20.09.2023.
//

import UIKit
import SnapKit

final class LevelViewController: UIViewController {

    let sections: [SectionType] = [.main]
    
    // MARK: - UI
    
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LevelCollectionViewCell.self, forCellWithReuseIdentifier: LevelCollectionViewCell.reuseID)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    // MARK: - setupViews
    
    private func setupViews() {
        view.addSubview(mainCollectionView)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.backgroundColor = AppColor.backgroundColor.uiColor
    }
    
    // MARK: - setupConstraints
    
    private func setupConstraints() {
        mainCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - createLayout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            let section = self?.sections[sectionIndex] ?? .main
            switch section {
            case .main:
                return self?.mainSectionLayout()
            }
        }
    }
    
    // MARK: - sectionLayout
    
    private func mainSectionLayout() -> NSCollectionLayoutSection {
        // Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(202)
            )
        )
        item.contentInsets.trailing = 20
        // Group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item]
        )
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 40
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 24,
            bottom: 10,
            trailing: 4
        )
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        return section
    }

    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(43)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
    }
}

extension LevelViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LevelCollectionViewCell.reuseID,
                for: indexPath
            ) as? LevelCollectionViewCell else {
                fatalError("Could not cast to LevelCollectionViewCell")
            }
        
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .main:
            return 8
        }
    }
}
