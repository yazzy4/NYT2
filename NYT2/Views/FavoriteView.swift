//
//  FavoriteView.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class FavoriteView: UIView {

    public lazy var favoriteCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 500)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(FavoriteCollectionViewCell.self, forCellWithReuseIdentifier: "Favorite")
        cv.backgroundColor = .white
        return cv
        
    }()
    
    func setupCellView() {
        addSubview(favoriteCollection)
        favoriteCollection.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoriteCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        favoriteCollection.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
    }
    
    private func commonInit() {
        setupCellView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
}
