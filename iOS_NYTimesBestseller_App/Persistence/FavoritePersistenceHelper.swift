//
//  FavoritePersistenceHelper.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct FavoritePersistenceHelper {
    static let manager = FavoritePersistenceHelper()
    
    func save(newFave: Favorites) throws {
        try persistenceHelper.save(newElement: newFave)
    }
    
    func getBestSellers() throws -> [Favorites] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteBestSellers(date: Date) throws {
        do {
//            let bestSeller =  try getBestSellers()
//            let newBestSellers = bestSeller.filter { $0.date != date}
//            try persistenceHelper.replace(elements: newBestSellers)
        }
    }
    
    private let persistenceHelper = PersistenceHelper<Favorites>(fileName: "Favorites.plist")
    
    private init() {}
}
