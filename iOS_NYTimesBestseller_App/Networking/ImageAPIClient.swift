//
//  ImageAPIClient.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/21/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct ImageAPIClient {
    let api_key = Secrets.bestseller_api_key
    
    static let manager = ImageAPIClient()
    
    func getImages(category: String, completionHandler: @escaping (Result<[Image]?, AppError>) -> Void) {
        
        let urlString = "https://api.nytimes.com/svc/books/v3/lists/current/\(category).json?api-key=\(api_key)"
        
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
                    do {
                        let response = try Image.getImages(from: data)
                        completionHandler(.success(response))
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
