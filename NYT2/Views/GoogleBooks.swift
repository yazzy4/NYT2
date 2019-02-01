//
//  Categories.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct GoogleBooks: Codable {
    let items: [Items]
}

struct Items: Codable {
    let volumeInfo: VolumeInfo
}
struct VolumeInfo: Codable {
    let description: String
    let imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}



