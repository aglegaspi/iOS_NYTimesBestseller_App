//
//  BestSellersVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class BestSellersVC: UIViewController {
  
  
  
  
  lazy var bestSellersHeaderLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .red
    return label
  }()
  
  lazy var bestSellersCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    
    collectionView.backgroundColor = .yellow
    
//    collectionView.register(BestSellersCell.self, forCellWithReuseIdentifier: "bestSellersCell")
    return collectionView
  }()
  
  lazy var bestSellersPicker: UIPickerView = {
    let picker = UIPickerView()
    return picker
  }()
  
  
  private func setUpSubviews() {
    self.view.addSubview(bestSellersHeaderLabel)
    self.view.addSubview(bestSellersCollectionView)
    self.view.addSubview(bestSellersPicker)
 
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpSubviews()
    self.view.backgroundColor = .white
    bestSellersCollectionView.delegate = self
    bestSellersCollectionView.dataSource = self
    bestSellersPicker.delegate = self
    bestSellersPicker.dataSource = self
    bestSellersCollectionView.register(BestSellersCell.self, forCellWithReuseIdentifier: "bestSellersCell")
    
    setUpConstraints()
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
      bestSellersHeaderLabel.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func bestSellersCollectionViewConstraints() {
    bestSellersCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      bestSellersCollectionView.topAnchor.constraint(equalTo: bestSellersHeaderLabel.bottomAnchor),
      bestSellersCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      bestSellersCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      bestSellersCollectionView.heightAnchor.constraint(equalToConstant: 300)
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
  
  let testArr = ["one", "two", "three"]
}



// MARK: - EXTENSIONS


extension BestSellersVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellersCell", for: indexPath) as! BestSellersCell
    
    cell.descriptionLabel.text = testArr[indexPath.row]
    
    return cell
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 200, height: 300)
  }
}


extension BestSellersVC: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return testArr.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return testArr[row]
  }
  
}
