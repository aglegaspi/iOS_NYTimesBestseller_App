//
//  iOS_NYTimesBestseller_AppTests.swift
//  iOS_NYTimesBestseller_AppTests
//
//  Created by Alexander George Legaspi on 10/20/19.
//  Copyright © 2019 Unit 4 Group Project. All rights reserved.
//

import XCTest

class iOS_NYTimesBestseller_AppTests: XCTestCase {
    
    func testBestSellerModelFromJSON() {

        guard let path = Bundle.main.path(forResource: "bestsellers", ofType: "json") else { print("No Path To JSON Found"); return }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let bestsellersArr = try BestSeller.getBestSellers(from: data)

            XCTAssert(bestsellersArr!.count > 0, "We have \(bestsellersArr!.count) bestsellers!")

        } catch {
            print(error)
            XCTFail()
        }

    }
    
    func testDataFromImageAPI() {
        
        
         func getDataFromImageAPI() -> Bool {
            let isbn = "0385514239"
            var image = [Image]()
            var output = false
            
            ImageAPIClient.manager.getImage(isbn: isbn) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let success):
                        image = success!
                        dump(success)
                        output = true
                        
                    case .failure(let error):
                        print("My error \(error)")
                    }
                }
                
            }
            return output
        }
        
        
        XCTAssert(getDataFromImageAPI() == true, "Did not get data from API")
    }
    
    
    
}
