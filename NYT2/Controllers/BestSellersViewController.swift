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
    
    public var bookGenre = [Results]() {
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
    
   public var bookDetail = [BookDetail]() {
        didSet{
            DispatchQueue.main.async {
                self.bestSellerView.bestSellerCollection.reloadData()
            }
        }
    }
    
    
    let bestSellerView = BestSellerView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.addSubview(bestSellerView)
        getCategories()
        setupBooks(genre: "Manga")
        bestSellerView.bestSellerCollection.dataSource = self
        bestSellerView.bestSellerCollection.delegate = self
        bestSellerView.bookPicker.dataSource = self
        bestSellerView.bookPicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userDefaultSettings()
    }
    
    private func getCategories() {
        NYTBookAPIClient.getBookCategories { (error, results) in
            if let error = error {
                print("Error:\(error)")
            } else if let results = results {
                self.bookGenre = results
                
            }
        }
        
    }
    
    public func setupBooks(genre: String) {
        NYTBookAPIClient.bookResults(listName: genre) { (appError, bookNames) in
            if let appError = appError {
                print("App Error: \(appError)")
            } else if let bookNames = bookNames {
                self.bookInfo = bookNames
                
            }
            
        }
    }
    
    func userDefaultSettings() {
        if let userDefault: String = UserDefaults.standard.object(forKey: NYTSecretKeys.nytKey) as? String {
            setupBooks(genre: userDefault.replacingOccurrences(of: " ", with: "-"))
            if let selectionRow = (UserDefaults.standard.object(forKey: DefaultGenre.pickerRow) as? String) {
                DispatchQueue.main.async {
                    self.bestSellerView.bookPicker.selectRow(Int(selectionRow)!, inComponent: 0, animated: true)
                }
            }
        }
    }

   
    
    
    
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
        GoogleAPIClient.getImage(keyword: currentBook.book_details[0].primary_isbn13) { (error, image) in
            if let _ = error {
                DispatchQueue.main.async {
                    cell.bookImage.image = UIImage(named: "book")
                }
            } else if let data = image {
                ImageHelper.fetchImageFromNetwork(urlString: data[0].volumeInfo.imageLinks.smallThumbnail, completion: { (error, smallThumby) in
                    if let error = error {
                        print("Thumby smalls image error:\(error) ")
                    } else if let smallThumby = smallThumby {
                        DispatchQueue.main.async {
                            cell.bookImage.image = smallThumby
                            cell.briefDescription.text = data[0].volumeInfo.description
                            }
                        }
                    })
                }
            }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let chosenCell = collectionView.cellForItem(at: indexPath) as? BestSellerCollectionViewCell else {return}
        let book = bookInfo[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.bookDetail = book.book_details[0]
        detailVC.detailView.detailImage.image = chosenCell.bookImage.image
        detailVC.detailView.detailTextView.text = chosenCell.briefDescription.text
        detailVC.detailView.detailLabel.text = book.book_details.first?.author
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}



extension BestSellersViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bookGenre.count
    }
    
    
 
}

extension BestSellersViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bookGenre[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setupBooks(genre: bookGenre[row].list_name.replacingOccurrences(of: " ", with: "-"))
    }
}

