//
//  DetailViewController.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/29/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var detailView = DetailView()
    public var bookDetail: BookDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        navigationItem.title = bookDetail?.title
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Favorite", style: .plain, target: self, action: #selector(favoriteButton))
    }
    
    @objc func favoriteButton() {}
    
    

    


}


