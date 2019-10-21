//
//  ImageAPIClient.swift
//  iOS_NYTimesBestseller_App
//
//  Created by Alexander George Legaspi on 10/21/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import Foundation

struct ImageAPIClient {
    
    static let manager = ImageAPIClient()
    
    func getImage(isbn: String, completionHandler: @escaping (Result<[Image]?, AppError>) -> Void) {
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(isbn)"
        
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
                        let response = try Image.getImage(from: data)
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
