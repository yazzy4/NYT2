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
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.text =  "Days on the bestseller list"
        label.isEnabled = true
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    public lazy var favoriteDescription: UITextView = {
        let text = UITextView()
        text.text = "Favorite blurb"
        return text
    }()
    
    public lazy var alertButton: UIButton = {
        let button = UIButton()
        button.setTitle(". . .", for: .normal)
        return button
    }()
    
 
    func setFavoriteImage(){
        addSubview(favoriteImage)
        favoriteImage.translatesAutoresizingMaskIntoConstraints = false
        favoriteImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoriteImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        favoriteImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }

    func setupFavoriteLabel() {
        addSubview(favoriteLabel)
    favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.bottomAnchor.constraint(equalTo: favoriteImage.bottomAnchor, constant: 40).isActive = true
        favoriteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoriteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func setupFavoriteDescription(){
        addSubview(favoriteDescription)
        favoriteDescription.translatesAutoresizingMaskIntoConstraints = false
        favoriteDescription.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor, constant: 10).isActive = true
        favoriteDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        favoriteDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoriteDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        
    }
    
    
    func setupAlert() {
        addSubview(alertButton)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        alertButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setFavoriteImage()
        setupFavoriteLabel()
        setupFavoriteDescription()
        setupAlert()
    }
}
