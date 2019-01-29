//
//  BestSellersViewController.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit
//sets up initial images -- MAINVIEW CONTROLLER
class BestSellersViewController: UIViewController {
    
    public var categories = [Results]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.bookPicker.reloadAllComponents()
            }
        }
    }
    let bestSellerView = BestSellerView()
    let detailsViewController = DetailViewController()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(bestSellerView)
        getCategories()
        bestSellerView.bestSellerCollection.dataSource = self
        bestSellerView.bestSellerCollection.delegate = self
        bestSellerView.bookPicker.dataSource = self
        bestSellerView.bookPicker.delegate = self
        
         
       
    }
    
    private func getCategories() {
        NYTBookAPI.getBookCategories { (error, results) in
            if let error = error {
                print("Error:\(error)")
            } else if let results = results {
                self.categories = results
            }
        }
    }
    
}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as? BestSellerCollectionViewCell else {
            return UICollectionViewCell() }
        return cell
    }
    
}

extension BestSellersViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
 
}

extension BestSellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row].display_name
    }
}

