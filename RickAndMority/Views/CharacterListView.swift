//
//  CharacterListView.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import UIKit
/// view that handles showing a list of characters
final class CharacterListView: UIView {
    private let viewModel = CharaterListViewViewModel()
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectioinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
       addSubviews(collectioinView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.fetchCharacrers()
        setupCollectionView()
    }
    required init?(coder: NSCoder) {
        fatalError("unSupported")
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectioinView.topAnchor.constraint(equalTo: topAnchor),
            collectioinView.leftAnchor.constraint(equalTo: leftAnchor),
            collectioinView.rightAnchor.constraint(equalTo: rightAnchor),
            collectioinView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            ]
        )
    }
    
    private func setupCollectionView() {
        collectioinView.dataSource = viewModel
    }
}
