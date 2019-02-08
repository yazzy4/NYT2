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
        let image = UIImageView(image: UIImage(named: "magicIcon"))
        image.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.isEnabled = true
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    public lazy var detailTextView: UITextView = {
        let description = UITextView()
        return description
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
    
    private func setDetailImage() {
        addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        detailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setDetailLabel () {
        addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        detailLabel.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 11).isActive = true
        
    }
    
    private func setDetailDescription() {
        addSubview(detailTextView)
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        detailTextView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 55).isActive = true
        detailTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        detailTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    }
    
    
    
    

}
