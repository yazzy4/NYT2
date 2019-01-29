//
//  BestSellarView.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class BestSellerView: UIView {
    
    public lazy var bestSellerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 200, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .horizontal
    
        
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSeller")
        cv.backgroundColor = .white
        return cv
        
    }()
    
    public lazy var bookPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        commonInit()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupCollectionView()
        setupPickerView()
    }
    
    private func setupCollectionView () {
        addSubview(bestSellerCollection)
        
        bestSellerCollection.translatesAutoresizingMaskIntoConstraints = false
        bestSellerCollection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bestSellerCollection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bestSellerCollection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bestSellerCollection.heightAnchor.constraint(equalTo:safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    func setupPickerView() {
        addSubview(bookPicker)
        bookPicker.translatesAutoresizingMaskIntoConstraints = false
        bookPicker.topAnchor.constraint(equalTo: bestSellerCollection.bottomAnchor).isActive = true
        bookPicker.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bookPicker.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
    
}

extension BestSellerView: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension BestSellerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Categories"
    }
}




