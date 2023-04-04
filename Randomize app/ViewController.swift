//
//  ViewController.swift
//  Randomize app
//
//  Created by Zaki on 04.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var minValueLabel: UILabel!
    @IBOutlet var maxValueLabel: UILabel!
    @IBOutlet var randomResultLabel: UILabel!
    
    @IBOutlet var getRandomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomButton.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }

        settingVC.minValue = minValueLabel.text
        settingVC.maxValue = maxValueLabel.text
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingVC = segue.source as? SettingsViewController else { return }
        
        minValueLabel.text = settingVC.minValueTF.text
        maxValueLabel.text = settingVC.maxValueTF.text
    }
    
    @IBAction func getRandomButtonTapped(_ sender: Any) {
        let minValue = Int(minValueLabel.text ?? "") ?? 0
        let maxValue = Int(maxValueLabel.text ?? "") ?? 100
        
        randomResultLabel.text = Int.random(in: minValue...maxValue).formatted()
    }
    
}

