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
    
    public var bookInfo = [Books]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.bestSellerCollection.reloadData()
            }
        }
    }
    
   
    
    let bestSellerView = BestSellerView()
    let labelView = BestSellerCollectionViewCell()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(bestSellerView)
        getCategories()
        setupCollectionView(genre: "Manga")
        bestSellerView.bestSellerCollection.dataSource = self
        bestSellerView.bestSellerCollection.delegate = self
        bestSellerView.bookPicker.dataSource = self
        bestSellerView.bookPicker.delegate = self
        
        
    }
    
    private func getCategories() {
        NYTBookAPIClient.getBookCategories { (error, results) in
            if let error = error {
                print("Error:\(error)")
            } else if let results = results {
                self.categories = results
                
            }
        }
        
    }
    

    
    private func setupCollectionView(genre: String) {
        NYTBookAPIClient.bookResults(listName: genre) { (appError, bookNames) in
            if let appError = appError {
                print("App Error: \(appError)")
            } else if let bookNames = bookNames {
                self.bookInfo = bookNames
                dump(self.bookInfo)
            }
            
        }
    }
    
   
    private func getBookImage() {}
    
    
}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bookInfo.count
       
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSeller", for: indexPath) as? BestSellerCollectionViewCell else {
            return UICollectionViewCell() }
        let currentBook = bookInfo[indexPath.row]
        cell.bestSellerLabel.text = "\(currentBook.weeks_on_list) weeks on Bestseller's list"
        cell.briefDescription.text = currentBook.book_details[0].description
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
        self.categories.sorted(by: {$0.display_name > $1.display_name} )
        return categories[row].display_name
    }
}

