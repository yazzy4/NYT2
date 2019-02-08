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
    
    public var favoriteBooks = [Books]() {
        didSet{
            DispatchQueue.main.async {
                self.favoriteView.reloadInputViews()
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
        getFavoriteBook()
    }
    
    func getFavoriteBook() {
      
    }
    
    
}

extension FavoritesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCollectionViewCell else {
            return UICollectionViewCell()}
            return cell

            }
        }
    
    


