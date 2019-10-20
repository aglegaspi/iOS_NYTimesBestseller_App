//
//  BookDetail.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

// MARK: - BestDetailWrapper
struct BestDetailWrapper: Codable {
    let items: [BookDetail]?
}

// MARK: - BookDetail
struct BookDetail: Codable {
    let selfLink: String?
    let volumeInfo: VolumeInfo?
    let saleInfo: SaleInfo?
    let searchInfo: SearchInfo?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country, saleability: String?
    let isEbook: Bool?
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title, subtitle: String?
    let authors: [String]?
    let publisher, publishedDate, volumeInfoDescription: String?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    let maturityRating: String?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink, infoLink: String?
    let canonicalVolumeLink: String?

    enum CodingKeys: String, CodingKey {
        case title, subtitle, authors, publisher, publishedDate
        case volumeInfoDescription = "description"
        case pageCount, printType, categories, averageRating, ratingsCount, maturityRating, imageLinks, language, previewLink, infoLink, canonicalVolumeLink
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let thumbnail: String?
}
