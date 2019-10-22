//
//  SettingsVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var categories: [Categories] = [] {
        didSet {
            categoryPicker.reloadAllComponents()
        }
    }
 
    //MARK: VIEWS
    var settingsLabel: UILabel = {
        var label = UILabel()
        label.text = "Pick Default Category"
        label.textAlignment = .center
        return label
    }()
    
    var categoryPicker: UIPickerView = {
        var picker = UIPickerView()

        picker.backgroundColor = .white
        return picker
    }()
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        loadListOfCategories()
        view.backgroundColor = .white
        loadViews()
        loadContraints()
        
    }
    
    
    //MARK: LOADERS
    private func loadViews() {
        view.addSubview(settingsLabel)
        view.addSubview(categoryPicker)
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
    }
    
    private func loadListOfCategories() {
        CategoriesAPIClient.manager.getCategories { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    guard let success = success else { return }
                    self.categories = success
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    //MARK: PRIVATE FUNCTIONS
    private func loadContraints() {
        settingsLabelConstraints()
        categoryPickerConstraints()
    }
    
    private func settingsLabelConstraints() {
      settingsLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
       settingsLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        settingsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        settingsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        settingsLabel.heightAnchor.constraint(equalToConstant: 30)
      ])
    }
    
    private func categoryPickerConstraints() {
      categoryPicker.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        categoryPicker.topAnchor.constraint(equalTo: settingsLabel.bottomAnchor),
        categoryPicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        categoryPicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        categoryPicker.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
      ])
    }


}

extension SettingsVC: UIPickerViewDelegate, UIPickerViewDataSource {
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
        // save this selection to USER DEFAULTS
        
        UserDefaultsWrapper.manager.store(categoryString: categories[row].listNameEncoded!)
        print(UserDefaultsWrapper.manager.getCategory())
        
        UserDefaultsWrapper.manager.store(categoryInt: row)
        print(UserDefaultsWrapper.manager.getCategoryInt())
    
    }
    
    
}
