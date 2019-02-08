//
//  FavoriteBooks.swift
//  NYT2
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct FavoriteBooks: Codable {
    let imageData: Data
    let author: String
    let description: String
    let createdAt: String
    let title: String
}
