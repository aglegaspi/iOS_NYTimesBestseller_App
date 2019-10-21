//
//  FavoritesCell.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    weak var delegate: CellDelegate?
    
    lazy var settingsButton: UIButton = {
        var settingsButton = UIButton()
//        settingsButton.backgroundColor = .systemPink
        settingsButton.setTitle("...", for: .normal)
        settingsButton.titleLabel?.font = .systemFont(ofSize: 50)
        settingsButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return settingsButton
    }()
    
    @objc func buttonAction(_ sender: UIButton) {
        print("working")

        delegate?.showActionSheet(tag: sender.tag)
    }
    
    lazy var weeksOnLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var favoritesImage: UIView = {
        var image = UIView()
        image.backgroundColor  = .black
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCellSubviews()
        setupCellContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCellSubviews() {
        contentView.addSubview(weeksOnLabel)
        contentView.addSubview(favoritesImage)
        contentView.addSubview(summaryLabel)
        contentView.addSubview(settingsButton)
    }

    private func setupCellContraints() {
        
        setupFavoritesImage()
        setupWeeksOn()
        setupSummaryLabel()
        setupButton()
    }
    
    private func setupButton() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: favoritesImage.topAnchor, constant: 0),
            settingsButton.leadingAnchor.constraint(equalTo: favoritesImage.trailingAnchor, constant: 20),
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            settingsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
            
        ])
    }
    
    
    private func setupFavoritesImage() {
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            favoritesImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            favoritesImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            favoritesImage.heightAnchor.constraint(equalToConstant: 300),
            favoritesImage.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
        private func setupWeeksOn() {
            weeksOnLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                
                weeksOnLabel.topAnchor.constraint(equalTo: favoritesImage.bottomAnchor, constant: 10),
                weeksOnLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                weeksOnLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                weeksOnLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    
    private func setupSummaryLabel() {
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            summaryLabel.topAnchor.constraint(equalTo: weeksOnLabel.bottomAnchor, constant: 10),
            summaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            summaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            summaryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }

}

