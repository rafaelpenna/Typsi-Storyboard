//
//  ViewController.swift
//  Typsi-Storyboard
//
//  Created by Rafael Penna on 30/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitBillLabel: UILabel!
    


    @IBAction func tipChanged(_ sender: UIButton) {
        if zeroPctButton.isTouchInside == true {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if tenPctButton.isTouchInside == true {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        if zeroPctButton.isSelected == true {
            print(0.0)
        } else if tenPctButton.isSelected == true {
            print(0.1)
        } else {
            print(0.2)
        }
    }
    
    
}

