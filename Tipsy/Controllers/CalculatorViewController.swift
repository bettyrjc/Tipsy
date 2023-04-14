//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
   
    var percentTipChoosed = 0.10
    var numberOfPeople = 2
    var result = 0.0
    @IBAction func tipChange(_ sender: UIButton) {
        billTextField.endEditing(true)
        let percentBtnPressed = sender.currentTitle!
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitleMinusPercentSign =  String(percentBtnPressed.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        percentTipChoosed = buttonTitleAsANumber / 100
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            result =  Double(bill)! * (1 + percentTipChoosed) / Double(numberOfPeople)
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    @IBAction func steperValueChange(_ sender: UIStepper) {
        sender.maximumValue = 12.0
        let valueSteper = Int(sender.value)
        splitNumberLabel.text = String(valueSteper)
        numberOfPeople = valueSteper
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let percent = String(format: "%.0f", percentTipChoosed * 100)
        if segue.identifier == "goToResults"{
            let destination = segue.destination as! ResultsViewController
            destination.result = result
            destination.message = "Split between \(numberOfPeople) people, with \(percent)% tip."
        }
    }
}

