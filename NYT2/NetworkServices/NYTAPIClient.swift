//
//  CategoryAPIClient.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/29/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

final class NYTBookAPIClient {
    private init() {}
    static func getBookCategories(completionHandler: @escaping (AppError?, [Results]?) -> Void) {
        
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.key)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let categoryInfo = try JSONDecoder().decode(Category.self, from: data)
                    completionHandler(nil, categoryInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func bookResults(listName: String, completionHandler: @escaping (AppError?, [Books]?) -> Void) {

        //listName use encoded
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.key)&list=\(listName)"

        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(NYTBestellers.self, from: data)
                    completionHandler(nil, bookInfo.results )
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}




