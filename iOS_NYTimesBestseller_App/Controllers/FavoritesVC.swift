//
//  FavoritesVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

protocol CellDelegate: AnyObject {
    func showActionSheet(tag: Int)
}

class FavoritesVC: UIViewController, CellDelegate {
    
    func showActionSheet(tag: Int) {
//        let faves = self.faves[tag]
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { (action) in
            
        }
        
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(deleteAction)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: PROPERTIES
    var faves = [Favorites]() {
        didSet {
            favoritesCollectionView.reloadData()
        }
    }
    
    var data = ["test", "testing", "tester"]
    
    //MARK: VIEWS
    lazy var favoritesHeaderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Favorites ()"
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        return label
    }()
    
    lazy var favoritesCollectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        //        collectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "favoriteCell")
        return collectionView
    }()
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        self.view.backgroundColor = .white
        favoritesCollectionView.delegate = self
        favoritesCollectionView.dataSource = self
        favoritesCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: "favoriteCell")
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData() {
        do {
            faves = try FavoritePersistenceHelper.manager.getBestSellers()
        } catch {
            print(error)
        }
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
            favoritesCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return faves.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentFaves = faves[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as! FavoritesCell
        //let selectedFavorite = data[indexPath.row]
        
        cell.delegate = self
        
        cell.weeksOnLabel.text = "\(currentFaves.weeksOnList) weeks on best seller list"
        
        ImageHelper.shared.getImage(urlStr: currentFaves.image) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let imageFromOnline):
                    cell.favoritesImage.image = imageFromOnline
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 400)
        
    }
}

