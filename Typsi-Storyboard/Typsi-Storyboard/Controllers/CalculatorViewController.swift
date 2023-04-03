//
//  ViewController.swift
//  Typsi-Storyboard
//
//  Created by Rafael Penna on 30/03/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let resultsScreen: ResultsViewController? = ResultsViewController()
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitBillLabel: UILabel!
    
    var numberToShare = 2
    var billValue = 0.0
    var billShared = 0.0
    var finalValue = "0.0"
    var tipPct: Int = 0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitBillLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        textFieldIsEmpty()
        calculateBill()
        resetTextField()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalValue
            destinationVC.tip = tipPct
            destinationVC.split = numberToShare
    }
    
    private func textFieldIsEmpty (){
        if billTextField.text != "" {
            billValue = Double(billTextField.text!)!
        } else {
            billValue = 0
        }
    }
    
    private func resetTextField() {
        billTextField.text = ""
    }
    
    private func calculateBill() {
        
        var tipValue: Double
        
        if zeroPctButton.isSelected == true {
            tipValue = 1.0
            tipPct = 0
        } else if tenPctButton.isSelected == true {
            tipValue = 1.1
            tipPct = 10
        } else {
            tipValue = 1.2
            tipPct = 20
        }
        
        numberToShare = Int(splitBillLabel.text!)!
        billShared = billValue * tipValue / Double(numberToShare)
        finalValue = String(format: "%.2f", billShared)
    }
}

