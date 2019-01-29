//
//  BestSellerCollectionViewCell.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

//MAIN VIEW
class BestSellerCollectionViewCell: UICollectionViewCell {
    
    public var setView = [NYTBestellers]()
    
    
    public lazy var bookImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "magicIcon"))
        image.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return image
    }()
    
    
    public lazy var bestSellerLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = true
        
        return label
    }()
    
    public lazy var briefDescription: UITextView = {
        let bd = UITextView()
        bd.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        bd.textColor = .black
        return bd
    }()
    
    func setBookImage() {
        addSubview(bookImage)
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        bookImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        bookImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        bookImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        bookImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func bestSellerLengthLabel() {
        addSubview(bestSellerLabel)
        bestSellerLabel.translatesAutoresizingMaskIntoConstraints = false
        bestSellerLabel.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 10).isActive = true
        bestSellerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bestSellerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    
    func setDescription() {
        addSubview(briefDescription)
        briefDescription.translatesAutoresizingMaskIntoConstraints = false
        briefDescription.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor).isActive = true
        briefDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        briefDescription.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
briefDescription.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
        briefDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
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
        setBookImage()
        bestSellerLengthLabel()
        setDescription()
    }
    
    
}
