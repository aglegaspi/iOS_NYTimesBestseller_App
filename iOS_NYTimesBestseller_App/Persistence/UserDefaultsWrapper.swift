//
//  UserDefaultsWrapper.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    static let manager = UserDefaultsWrapper()
    
    //MARK: GET
    
    func getCategory() -> String? {
        return UserDefaults.standard.value(forKey: userCategoryKey) as? String
    }
    
    func getCategoryInt() -> Int? {
        return UserDefaults.standard.value(forKey: userCategoryIntKey) as? Int
    }
    
    //MARK: SAVE
    
    func store(categoryString: String) {
        UserDefaults.standard.set(categoryString, forKey: userCategoryKey)
    }
    
    func store(categoryInt: Int) {
        UserDefaults.standard.set(categoryInt, forKey: userCategoryIntKey)
    }
    
    //MARK: KEYS
    
    private let userCategoryKey = "userCategory"
    private let userCategoryIntKey = "userCategoryInt"
    
    private init() {}
}

