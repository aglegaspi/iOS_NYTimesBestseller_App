//
//  Categories.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/20/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct CategoriesWrapper: Codable {
    let results: [Categories]
}

struct Categories: Codable {
    let listName: String

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
    }
}
