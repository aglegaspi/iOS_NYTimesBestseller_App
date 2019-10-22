//
//  DetailVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
  
  
  var bestSeller: BestSeller!
  
  var bestSellerImage: Image!
    
   //MARK: -- Properties
   
   lazy var navigationBar: UINavigationBar = {
       let navbar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 45))
       return navbar
   }()
   
   lazy var favoritesButton: UIBarButtonItem = {
       let button = UIBarButtonItem(title: "Favorite", style: .plain, target: self.navigationBar, action: #selector(favoritesPressed))
       return button
   }()
   
   lazy var doneButton: UIBarButtonItem = {
       let button = UIBarButtonItem(title: "Done", style: .done, target: self.navigationBar, action: #selector(doneButtonPressed))
       return button
   }()
   
   lazy var bookImageView: UIImageView = {
       let image = UIImage()
       let imageView = UIImageView(image: image)
       imageView.contentMode = .scaleAspectFit
      getImage()
      return imageView
   }()
   
   lazy var authorLabel: UILabel = {
       let label = UILabel()
       label.text = bestSeller.bookInfo?[0].author
       label.textAlignment = .center
       return label
   }()
   
   lazy var summary: UITextView = {
       let textView = UITextView()
    textView.text = bestSeller.bookInfo?[0].bookDetailDescription
       textView.textAlignment = .left
       textView.font = UIFont(name: "Arial", size: 15)
       return textView
   }()
   
   
   //MARK: -- View Did Load
   
   override func viewDidLoad() {
       super.viewDidLoad()
      view.backgroundColor = .white
      setUpNavBarWithButtons()
      addSubviews()
      setConstraints()
//      setUpMiscellaneousThings()

   }
   
   //MARK: -- Functions
  
  
  func getImage() {
//    ImageHelper.shared.getImage(urlStr: bestSellerImage.bookImage!) { (result) in
//        DispatchQueue.main.async {
//            switch result {
//            case .success (let image):
//              self.bookImageView.image = image
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
  }
   
   private func setUpMiscellaneousThings() {
       
//       bookImage.image = #imageLiteral(resourceName: "placeholder")
   }
   
   private func addSubviews() {
       self.view.addSubview(bookImageView)
       self.view.addSubview(authorLabel)
       self.view.addSubview(summary)
       self.view.addSubview(navigationBar)
   }
   
   private func setUpNavBarWithButtons() {
       let navigationItem = UINavigationItem(title: "look at this book")
       navigationItem.rightBarButtonItem = favoritesButton
       navigationItem.leftBarButtonItem = doneButton
       navigationBar.setItems([navigationItem], animated: true)
   }
   
   @objc private func favoritesPressed() {
       
   }
   
   @objc private func doneButtonPressed() {
       
   }

   //MARK: -- Constraints Function
   private func setConstraints() {
       
       //navigationBar Constraints
       navigationBar.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
           navigationBar.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
       ])
       
       
       //bookImage Constraints
       bookImageView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           bookImageView.widthAnchor.constraint(equalToConstant: 300),
           bookImageView.heightAnchor.constraint(equalToConstant: 400),
           bookImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
           bookImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
       ])
       
       //authorLabel Constraints
       authorLabel.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
           authorLabel.widthAnchor.constraint(equalToConstant: 400),
           authorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
           authorLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 10)
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
}
