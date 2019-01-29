//
//  FavoriteCollectionViewCell.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class FavoriteCollectionViewCell: UICollectionViewCell {
    public lazy var favoriteImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "blueRaspberry"))
        image.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return image
    }()
    
    public lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text =  "Days on the bestseller list"
        return label
    }()
    
    public lazy var favoriteDescription: UITextField = {
        let text = UITextField()
        text.text = "Favorite blurb"
        return text
    }()
    
    public lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle(". . .", for: .normal)
        button.addTarget(self, action: #selector(alertButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func alertButtonPressed() {
        
    }
    
    
    
}
