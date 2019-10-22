//
//  Image.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/21/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct ImageWrapper: Codable {
    let results: Results?
}

struct Results: Codable {
    let books: [Image]?
}

struct Image: Codable {
    let bookImage: String?

    enum CodingKeys: String, CodingKey {
        case bookImage = "book_image"
    }
    
    static func getImages(from data: Data) throws -> [Image]? {
        do {
            let response = try JSONDecoder().decode(ImageWrapper.self,from: data)
            return response.results?.books
        } catch {
            return nil
        }
    }
}
