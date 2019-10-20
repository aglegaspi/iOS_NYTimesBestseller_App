//
//  BestSellerAPIClient.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/18/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct BestSellerAPIClient {
    let api_key = Secrets.bestseller_api_key
    
    static let manager = BestSellerAPIClient()
    
    func getBestSeller(genre: String, completionHandler: @escaping (Result<[BestSeller]?, AppError>) -> Void) {
        
        let urlString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(api_key)&list=\(genre)"
        
        print(urlString)
        guard let url = URL(string: urlString) else {
            fatalError("bad URL")
        }
        
        NetworkManager.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                    return
                    
                case let .success(data):
                    // TODO:
                    do {
                        let response = try BestSeller.getBestSellers(from: data)
                        completionHandler(.success(response))
                        print(response!)
                    }
                    catch {
                        completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                    }
                }
            }
        }
    }
    
    private init() {}
}
