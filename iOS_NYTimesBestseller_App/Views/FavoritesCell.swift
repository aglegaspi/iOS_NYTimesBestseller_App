//
//  FavoritesCell.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    
    lazy var textLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private func setupTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
        ])
    }

}

