//
//  SettingsVC.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    //var categories: Categories!
    let pickerData = ["11", "12", "13"]
    
    //MARK: VIEWS
    var settingsLabel: UILabel = {
        var label = UILabel()
        label.text = "Pick Default Category"
        label.textAlignment = .center
        return label
    }()
    
    var categoryPicker: UIPickerView = {
        var picker = UIPickerView()
    
        
        return picker
    }()
    
    //MARK: LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
}
