//
//  FavoritesVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var data = ["test", "testing", "tester"]
    
    //MARK: VIEWS
    lazy var favoritesHeaderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    lazy var favoritesCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .yellow
        return collectionView
    }()
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
        self.favoritesCollectionView.dataSource = self
        self.favoritesCollectionView.delegate = self
        
        
    }
    
    private func setUpSubviews() {
        self.view.addSubview(favoritesHeaderLabel)
        self.view.addSubview(favoritesCollectionView)
        
    }
    
    private func setUpConstraints() {
        favoritesHeaderLabelConstraints()
        favoritesCollectionViewConstraints()
    }
    
    private func favoritesHeaderLabelConstraints() {
        favoritesHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesHeaderLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            favoritesHeaderLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesHeaderLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesHeaderLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func favoritesCollectionViewConstraints() {
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoritesCollectionView.topAnchor.constraint(equalTo: favoritesHeaderLabel.bottomAnchor),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            favoritesCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCell.identifier, for: indexPath) as! FavoritesCell
        
        cell.textLabel.text = data[indexPath.item]
        return cell
    }
    
}
