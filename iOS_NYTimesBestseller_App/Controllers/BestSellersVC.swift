//
//  BestSellersVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class BestSellersVC: UIViewController {
    
    //MARK: VARIABLES
    var default_category = "combined-print-and-e-book-fiction"
    
    var bestsellers: [BestSeller] = [] {
        didSet {
            bestSellersCollectionView.reloadData()
        }
    }
    
    var categories = [Categories]() {
        didSet {
            bestSellersPicker.reloadAllComponents()
        }
    }
    
    var images = [Image]() {
        didSet {
            bestSellersCollectionView.reloadData()
        }
    }
    
    //MARK: VIEWS
    lazy var bestSellersHeaderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "Best Sellers"
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        return label
    }()
    
    lazy var bestSellersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .opaqueSeparator
        collectionView.register(BestSellersCell.self, forCellWithReuseIdentifier: "bestSellersCell")
        return collectionView
    }()
    
    lazy var bestSellersPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListOfCategories()
    
        setUpSubviews()
        self.view.backgroundColor = .white
        setupDelegatesAndDataSource()
        setUpConstraints()
        
    }
    
    //MARK: SETUP FUNCTIONS
    private func setUpSubviews() {
        self.view.addSubview(bestSellersHeaderLabel)
        self.view.addSubview(bestSellersCollectionView)
        self.view.addSubview(bestSellersPicker)
    }
    
    private func setupDelegatesAndDataSource() {
        bestSellersCollectionView.delegate = self
        bestSellersCollectionView.dataSource = self
        bestSellersPicker.delegate = self
        bestSellersPicker.dataSource = self
    }
    
    //MARK: PRIVATE FUNCTIONS
    
    private func loadUserDefaults() {
        print(UserDefaultsWrapper.manager.getCategory() ?? "nothing stored in UD")
        
        if let selected_catgory = UserDefaultsWrapper.manager.getCategory() {
            default_category = selected_catgory
        }
        print(default_category)
        loadBestSellers(selected_category: default_category)
        
        guard let selectedCategoryInt = UserDefaultsWrapper.manager.getCategoryInt() else {return}
        bestSellersPicker.selectRow(selectedCategoryInt, inComponent: 0, animated: true)
        bestSellersPicker.reloadAllComponents()
        
        //    } else {
        //    loadListOfCategories()
        //    loadBestSellers(selected_category: default_category)
        //    loadImages(category: default_category)
    }
    
    
    private func loadListOfCategories() {
        
        CategoriesAPIClient.manager.getCategories { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    guard let success = success else { return }
                    self.categories = success
                    self.loadUserDefaults()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func loadBestSellers(selected_category: String) {
        let category = self.categories[self.bestSellersPicker.selectedRow(inComponent: 0)].listNameEncoded ?? "combined-print-and-e-book-fiction"
        
        BestSellerAPIClient.manager.getBestSeller(category: selected_category) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.bestsellers = success!
                    
                    ImageAPIClient.manager.getImages(category: category) { (result) in
                        DispatchQueue.main.async {
                            switch result {
                            case .success(let images):
                                self.images = images ?? []
                            case .failure(let error):
                                print(error)
                                
                            }
                        }
                        
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func loadImages(category: String) {
        
        ImageAPIClient.manager.getImages(category: category) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.images = success!
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    
    // MARK: - CONSTRAINTS
    
    private func setUpConstraints() {
        bestSellersHeaderLabelConstraints()
        bestSellersCollectionViewConstraints()
        bestSellersPickerConstraints()
    }
    
    private func bestSellersHeaderLabelConstraints() {
        bestSellersHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bestSellersHeaderLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            bestSellersHeaderLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bestSellersHeaderLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bestSellersHeaderLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func bestSellersCollectionViewConstraints() {
        bestSellersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bestSellersCollectionView.topAnchor.constraint(equalTo: bestSellersHeaderLabel.bottomAnchor),
            bestSellersCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bestSellersCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bestSellersCollectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    
    private func bestSellersPickerConstraints() {
        bestSellersPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bestSellersPicker.topAnchor.constraint(equalTo: bestSellersCollectionView.bottomAnchor),
            bestSellersPicker.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            bestSellersPicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bestSellersPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
}



// MARK: - EXTENSIONS


extension BestSellersVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestsellers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellersCell", for: indexPath) as! BestSellersCell
        
        let book = bestsellers[indexPath.row]

        cell.weeksOnLabel.text = "\(book.weeksOnList ?? 0) weeks as best seller"
        cell.descriptionLabel.text = book.bookInfo?[0].bookDetailDescription
        
        if images.count > 0, let imageURL = self.images[indexPath.row].bookImage {
        ImageHelper.shared.getImage(urlStr: imageURL) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success (let image):
                    cell.bestSellerImage.image = image
                case .failure(let error):
                    print(error)
                }
            }
        }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell pressed")
        let dvc = DetailVC()
        dvc.modalPresentationStyle = .currentContext
        let selectedBook = bestsellers[indexPath.row]
        dvc.bestSeller = selectedBook
        self.present(dvc, animated: true, completion: nil)
        
    }
    
}


extension BestSellersVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].displayName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let selectedCategory = categories[row].listNameEncoded else { return }
        loadBestSellers(selected_category: selectedCategory)
        self.bestSellersCollectionView.reloadData()
    }
    
}
