//
//  FavoritesModel.swift
//  NYT2
//
//  Created by Yaz Burrell on 2/8/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation
final class FavoriteModel {
    private static let filename = "SavedBookList.plist"
    private static var favorites = [FavoriteBooks]()
    private init() {}
    
    
    static func appendBook(favorite: FavoriteBooks) {
        favorites.append(favorite)
        saveBook()
    }
    
    static func saveBook() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        
        do {
            let data = try PropertyListEncoder().encode(favorites)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoder: \(error)")
        }
    }
    static func deleteBook(index: Int) {
        favorites.remove(at: index)
        saveBook()
    }
    static func getBooks() -> [FavoriteBooks] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favorites = try PropertyListDecoder().decode([FavoriteBooks].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getBooks - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        favorites = favorites.sorted {$0.createdAt > $1.createdAt}
        return favorites
    }
    
    static func editBook(books: FavoriteBooks, atIndex index: Int){
        favorites.remove(at: index)
        favorites.insert(books, at: index)
        favorites.sorted {$0.createdAt > $1.createdAt}
        saveBook()
    }
    
    static func update(books: FavoriteBooks, atIndex index: Int){
        favorites[index] = books
        saveBook()
    }
}
