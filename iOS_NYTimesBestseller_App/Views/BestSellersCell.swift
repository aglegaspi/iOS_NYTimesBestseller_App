//
//  BestSellersCell.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class BestSellersCell: UICollectionViewCell {
    
  lazy var bestSellerImage: UIImageView = {
    let image = UIImageView()
    return image
  }()
  
  lazy var weeksOnLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
//    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 5
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setUpCellSubviews()
    setUpCellConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUpCellSubviews() {
    contentView.addSubview(bestSellerImage)
    contentView.addSubview(weeksOnLabel)
    contentView.addSubview(descriptionLabel)
  }
  
  
  
  // MARK: - CONSTRAINTS

  private func setUpCellConstraints () {
    bestSellerImageConstraints()
    weeksOnLabelConstraints()
    descriptionLabelConstraints()
  }
  
  private func bestSellerImageConstraints() {
    bestSellerImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      bestSellerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -25) ,
      bestSellerImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      bestSellerImage.heightAnchor.constraint(equalToConstant: 200),
      bestSellerImage.widthAnchor.constraint(equalToConstant: 135)
    ])
  }
  
  private func weeksOnLabelConstraints() {
    weeksOnLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      weeksOnLabel.topAnchor.constraint(equalTo: bestSellerImage.bottomAnchor, constant: 15),
      weeksOnLabel.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
      weeksOnLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      weeksOnLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func descriptionLabelConstraints() {
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: weeksOnLabel.bottomAnchor, constant: 10),
      descriptionLabel.leadingAnchor.constraint(equalTo:  self.leadingAnchor),
      descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 25)
    ])
  }
  
  
  
}
