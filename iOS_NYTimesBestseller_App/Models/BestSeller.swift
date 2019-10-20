//
//  BestSeller.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

// MARK: - BestSellerWrapper
struct BestSellerWrapper: Codable {
    let results: [BestSeller]?
}

// MARK: - BestSeller
struct BestSeller: Codable {
    let listName, bestsellersDate, publishedDate: String?
    let rank, weeksOnList: Int?
    let isbns: [Isbn]?
    let bookInfo: [BookInfo]?
    
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case rank
        case weeksOnList = "weeks_on_list"
        case isbns
        case bookInfo = "book_details"
    }
    
    static func getBestSellers(from data: Data) throws -> BestSeller? {
        // TODO:
        do {
            let response = try JSONDecoder().decode(BestSeller.self,from: data)
            return response
        } catch {
            return nil
        }
        
    }
}

// MARK: - BookInfo
struct BookInfo: Codable {
    let title, bookDetailDescription, contributor, author: String?
    let publisher: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case bookDetailDescription = "description"
        case contributor, author, publisher
    }
}

// MARK: - ISBN
struct Isbn: Codable {
    let isbn10: String?
}
