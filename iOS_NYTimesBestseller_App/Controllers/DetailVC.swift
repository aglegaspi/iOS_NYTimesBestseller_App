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
        let button = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favoritesPressed))
        return button
    }()
    
    lazy var doneButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonPressed))
        return button
    }()
    
    lazy var bookImageView: UIImageView = {
        let image = UIImage()
        
        ImageHelper.shared.getImage(urlStr: bestSellerImage.bookImage!) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success (let image):
                  self.bookImageView.image = image
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = bestSeller.bookInfo?[0].author
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        return label
    }()
    
    lazy var summary: UITextView = {
        let textView = UITextView()
        textView.text = bestSeller.bookInfo?[0].bookDetailDescription
        textView.textAlignment = .left
        textView.font = UIFont(name: "Arial", size: 20)
        textView.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        return textView
    }()
    
    
    //MARK: -- View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBarWithButtons()
        addSubviews()
        setConstraints()
        setGradientBackground(colorBottom: .systemGreen, colorTop: .white)
    }
  
    
    //MARK: -- Functions
    
    private func addSubviews() {
        self.view.addSubview(bookImageView)
        self.view.addSubview(authorLabel)
        self.view.addSubview(summary)
        self.view.addSubview(navigationBar)
    }
  
  private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor){
       let gradientLayer = CAGradientLayer()
       gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
       gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
       gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
       gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
       gradientLayer.frame = view.bounds

     self.view.layer.insertSublayer(gradientLayer, at: 0)
   }
    
    private func setUpNavBarWithButtons() {
        let navigationItem = UINavigationItem(title: (self.bestSeller.bookInfo?[0].title)!)
        navigationItem.rightBarButtonItem = favoritesButton
        navigationItem.leftBarButtonItem = doneButton
        navigationBar.setItems([navigationItem], animated: true)
    }
    
    @objc private func favoritesPressed() {
        
        //FOR TESTING
        func loadData() -> [Favorites]{
            do {
                let faves = try FavoritePersistenceHelper.manager.getBestSellers()
                return faves
            } catch {
                print(error)
            }
            return []
        }
        
        dump(loadData())
        //FOR TESTING
        
        guard let weeksOnListUnwrapped = bestSeller.weeksOnList else {
            print("no info for weeks on best seller list")
            return
        }
        guard let bookInfoUnwrapped = bestSeller.bookInfo else {
            print("no book info found")
            return
        }
        
        let newBook = Favorites(weeksOnList: weeksOnListUnwrapped, bookInfo: bookInfoUnwrapped, image: bestSellerImage.bookImage ?? "no book image")
        
        let confirmationAlert = UIAlertController(title: "Favorite Added!", message: "Your book has been favorited! Check your Favorites tab!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        confirmationAlert.addAction(okButton)
        
        DispatchQueue.global(qos: .utility).async {
            try? FavoritePersistenceHelper.manager.save(newFave: newBook)
        }
        
        self.present(confirmationAlert, animated: true)
        
    }
    
    @objc private func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
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
            authorLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 15)
        ])
        
        //bookSummary Constraints
        summary.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            summary.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            summary.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            summary.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            summary.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            summary.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
            
        ])
        
    }
}
