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
        userDefaultSettings()
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
    }
    
    

    func userDefaultSettings() {
        NYTBookAPIClient.getBookCategories { (appError, results) in
            if let appError = appError {
                print("No categories bruh \(appError)")
            } else if let results = results {
                self.settingsResults = results
                if let selectionRow = (UserDefaults.standard.object(forKey: DefaultGenre.pickerRow) as? String) {
                    DispatchQueue.main.async {
                        self.settingsView.settingsPicker.selectRow(Int(selectionRow)!, inComponent: 0, animated: true)
                    }
                }
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
 
        return settingsResults[row].list_name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
         
    }
}

