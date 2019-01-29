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
        view.addSubview(settingsView)
        settingsView.settingsPicker.dataSource = self
        settingsView.settingsPicker.delegate = self
    }
    
    
    
    
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Settings"
    }
    
}
