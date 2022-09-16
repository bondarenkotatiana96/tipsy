//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
                
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleNumber = Double(String(buttonTitle.dropLast()))!
        
        tip = buttonTitleNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? ""
        
        if bill != "" {
            billTotal = Double(bill) ?? 0.0
            
            let result = (billTotal + (billTotal * tip)) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.tip = tip * 100
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.result = finalResult
        }
    }
    
}

