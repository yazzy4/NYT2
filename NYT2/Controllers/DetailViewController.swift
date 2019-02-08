//
//  DetailViewController.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/29/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var detailView = DetailView()
    public var bookDetail: BookDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        navigationItem.title = bookDetail?.title
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButtonPressed))
    }
    
    @objc func favoriteButtonPressed() {
        guard let book = saveBook() else {return}
        FavoriteModel.appendBook(favorite: book)
    }
    
    private func saveBook()-> FavoriteBooks? {
        guard let image = detailView.detailImage.image,
            let author = detailView.detailLabel.text,
            let description = detailView.detailTextView.text else {return nil}
        guard let title =  title else {return nil}
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .medium
        let timestamp = formatter.string(from: date)
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let favoriteBook = FavoriteBooks.init(imageData: imageData, author: author, description: description, createdAt: timestamp, title: title)
        return favoriteBook
    }
    
    

    


}


