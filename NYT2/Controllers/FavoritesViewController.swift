//
//  FavoritesViewController.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit
class FavoritesViewController: UIViewController {
    
    var favoriteView = FavoriteView()
    
    public var favoriteBooks = [FavoriteBooks]() {
        didSet{
            DispatchQueue.main.async {
                self.favoriteView.favoriteCollection.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.title = "Favorites"
        favoriteView.favoriteCollection.dataSource = self
        favoriteView.favoriteCollection.delegate = self
         view.addSubview(favoriteView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoriteBooks = FavoriteModel.getBooks()
    }
    
   

    
    
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(favoriteBooks.count)
        return favoriteBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()}
        let currentFav = favoriteBooks[indexPath.row]
        cell.favoriteImage.image = UIImage(data: currentFav.imageData)
        cell.favoriteLabel.text = currentFav.author
        cell.favoriteDescription.text = currentFav.description
        cell.alertButton.tag = indexPath.row
        cell.alertButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        
        return cell
    }
    
    @objc func deleteButtonPressed(sender: UIButton){
        // create action sheet
        let actionSheet = UIAlertController(title: "nil", message: "message", preferredStyle: .actionSheet)
        // create delete option
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            FavoriteModel.deleteBook(index: sender.tag)
            self.favoriteBooks = FavoriteModel.getBooks()
        }
        // create cancel option
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        // add delete & cancel to action sheet
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        //present action sheet
        present(actionSheet, animated: true, completion: nil)
        
      
    }
    
    
    
    
}
    
    


