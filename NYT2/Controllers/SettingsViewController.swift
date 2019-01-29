//
//  SettingsViewController.swift
//  NYT2
//
//  Created by Yaz Burrell on 1/28/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .white
        view.addSubview(settingsView)
    }
    
    
    
    
}
