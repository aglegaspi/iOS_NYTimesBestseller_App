//
//  CategoriesAPIClient.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/20/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct CategoriesAPIClient {
    let key = Secrets.bestseller_api_key
    
    static let manager = CategoriesAPIClient()
    
    func getCategories(isbn: String, completionHandler: @escaping (Result<[Categories]?, AppError>) -> Void) {
        
        let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(key)"
        
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
                        let response = try Categories.getCategories(from: data)
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
