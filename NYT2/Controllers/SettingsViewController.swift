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
    public var settingsResults = [Results](){
        didSet {
            DispatchQueue.main.async {
                self.settingsView.settingsPicker.reloadAllComponents()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingsView)
        getCategories()
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
    }
    
    private func getCategories() {
        NYTBookAPIClient.getBookCategories { (error, results) in
            if let error = error {
                print("Error:\(error)")
            } else if let results = results {
                self.settingsResults = results
                
            }
        }
    }

    
    
    
}


extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingsResults.count
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
 
        return settingsResults[row].display_name
    }
}

