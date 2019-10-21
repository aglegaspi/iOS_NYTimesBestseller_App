//
//  DetailVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

  //MARK: -- Properties
    
//        lazy var navigationBar: UINavigationBar = {
//            let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 45))
//            return navbar
//        }()
    
        lazy var bookImage: UIImageView = {
            let image = UIImage()
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var authorLabel: UILabel = {
            let label = UILabel()
            label.text = "let's get funky"
            label.textAlignment = .center
            return label
        }()
        
        lazy var summary: UITextView = {
            let textView = UITextView()
            textView.text = placeholderText
            textView.textAlignment = .left
            return textView
        }()
        
        let placeholderText = "The FitnessGram Pacer Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The 20 meter pacer test will begin in 30 seconds. Line up at the start. The running speed starts slowly but gets faster each minute after you hear this signal bodeboop. A sing lap should be completed every time you hear this sound. ding Remember to run in a straight line and run as long as possible. The second time you fail to complete a lap before the sound, your test is over. The test will begin on the word start. On your mark. Get ready!… Start. ding﻿"
        
        //MARK: -- View Did Load
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            addSubviews()
            bookImage.image = #imageLiteral(resourceName: "placeholder")
            setConstraints()
        }
        //MARK: -- Functions
        
        
        private func setConstraints() {
            //bookImage Constraints
            bookImage.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                bookImage.widthAnchor.constraint(equalToConstant: 300),
                bookImage.heightAnchor.constraint(equalToConstant: 400),
                bookImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                bookImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
            ])
            
            //authorLabel Constraints
            authorLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                authorLabel.widthAnchor.constraint(equalToConstant: 400),
                authorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
                authorLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10)
            ])
            
            //bookSummary Constraints
            summary.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                summary.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                summary.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                summary.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
                summary.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 15),
                summary.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        
            ])
            
        }
        
        
        
        private func addSubviews() {
            self.view.addSubview(bookImage)
            self.view.addSubview(authorLabel)
            self.view.addSubview(summary)
//            self.view.addSubview(navigationBar)
    }

}
