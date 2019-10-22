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
    
    func getCategory() -> String? {
        return UserDefaults.standard.value(forKey: userCategoryKey) as? String
    }
    
    func store(searchString: String) {
        UserDefaults.standard.set(searchString, forKey: userCategoryKey)
    }
    
    private let userCategoryKey = "userCategory"
    
    private init() {}
}
