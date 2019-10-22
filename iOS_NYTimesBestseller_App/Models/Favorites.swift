//
//  Favorites.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Radharani Ribas-Valongo on 10/22/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct Favorites: Codable {
    let weeksOnList: Int
    let bookInfo: [BookInfo]
//    let image: String
}
