//
//  Image.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/21/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation


// MARK: - ImageWrapper
struct ImageWrapper: Codable {
    let items: [Image]?
    
}

// MARK: - Item
struct Image: Codable {
    let volumeInfo: VolumeInf?
    
    static func getImage(from data: Data) throws -> [Image]? {
        // TODO:
        do {
            let response = try JSONDecoder().decode(ImageWrapper.self,from: data)
            return response.items
        } catch {
            return nil
        }
        
    }
}

// MARK: - VolumeInfo
struct VolumeInf: Codable {
    let imageLinks: ImageLink?
}

// MARK: - ImageLinks
struct ImageLink: Codable {
    let smallThumbnail, thumbnail: String?
}
