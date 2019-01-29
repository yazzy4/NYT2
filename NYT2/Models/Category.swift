//
//  BookType.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct Category: Codable {
    let results: [Results]
}
struct Results: Codable {
    let list_name: String
    let display_name: String
    let oldest_published_date: String
    let newest_published_date: String
    let updated: String
}
