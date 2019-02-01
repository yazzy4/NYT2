//
//  DetailView.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/29/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class DetailView: UIView {
    public lazy var detailImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: ""))
        image.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return image
    }()
    
    public lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = true
        label.textAlignment = .center
        return label
    }()
    public lazy var detailDescription: UITextView = {
        let description = UITextView()
        return description
    }()
    
    private func setDetailImage() {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        detailImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func setDetailLabel () {
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    private func setDetailDescription() {
        addSubview(detailDescription)
        detailDescription.translatesAutoresizingMaskIntoConstraints = false
        detailDescription.topAnchor.constraint(equalTo: detailLabel.bottomAnchor).isActive = true
        detailDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        detailDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    
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
        setDetailImage()
        setDetailLabel()
        setDetailDescription()
    }
    
    

}
