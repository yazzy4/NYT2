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
    var defaultCategory = "Manga"
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
        
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
        userDefaultSettings()
    }
    
    

    func userDefaultSettings() {
        NYTBookAPIClient.getBookCategories { (appError, results) in
            if let appError = appError {
                print("No categories bruh \(appError)")
            } else if let results = results {
                self.settingsResults = results
                if let categoryName = (UserDefaults.standard.object(forKey: DefaultGenre.pickerRow) as? String) {
                    let rowNum = self.settingsResults.firstIndex { $0.list_name_encoded == categoryName }
                    if let _ = rowNum {
                        DispatchQueue.main.async {
                            self.settingsView.settingsPicker.selectRow(rowNum!, inComponent: 0, animated: true)
                        }
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
        let categoryName = settingsResults[row].list_name_encoded
        UserDefaults.standard.set(categoryName, forKey: DefaultGenre.pickerRow)
    }
}

