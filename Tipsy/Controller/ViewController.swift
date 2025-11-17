//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Input field
    @IBOutlet weak var BillTotalInputField: UITextField!
    
    // Select Tip Buttons
    @IBOutlet weak var ZeroPerTipButton: UIButton!
    @IBOutlet weak var TenPerTipButton: UIButton!
    @IBOutlet weak var TwentyPerTipButton: UIButton!
    
    // Split Number
    @IBOutlet weak var SplitValueLabel: UILabel!
    
    // Variables
    var tipValue: Double = 10.0; // since 10% is selected by default
    var splitValue: Double = 2.0; // since 2 is the default value
    var billTotal: Double = 0.0; // Inputed by the user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillTotalInputField.keyboardType = .decimalPad
        hideKeyboardWhenTappedAround()
        TenPerTipButton.isSelected = true;
    }

    @IBAction func PressedInputField(_ sender: UITextField) {
        BillTotalInputField.text = sender.text
        billTotal = Double(BillTotalInputField.text!) ?? 0.0
    }
    
    
    @IBAction func PressedTipButton(_ sender: UIButton) {
        switch sender {
        case ZeroPerTipButton:
            ZeroPerTipButton.isSelected = true
            TenPerTipButton.isSelected = false
            TwentyPerTipButton.isSelected = false
            
            tipValue = 0.0
        case TenPerTipButton:
            ZeroPerTipButton.isSelected = false
            TenPerTipButton.isSelected = true
            TwentyPerTipButton.isSelected = false
            
            tipValue = 10.0
        case TwentyPerTipButton:
            ZeroPerTipButton.isSelected = false
            TenPerTipButton.isSelected = false
            TwentyPerTipButton.isSelected = true
            
            tipValue = 20.0
        default:
            ZeroPerTipButton.isSelected = false
            TenPerTipButton.isSelected = false
            TwentyPerTipButton.isSelected = false
            tipValue = 0.0
        }
        
        print(tipValue);
    }
    
    @IBAction func SplitValueStepperChanged(_ sender: UIStepper) {
        splitValue = Double(sender.value);
        SplitValueLabel.text = "\(Int(sender.value))";
        
        print(splitValue)
    }
    
    func calculateBill(_ tipValue: Double, _ splitValue: Double, _ billTotal: Double) -> Double {
        let tipPerPerson = (billTotal * (tipValue / 100.0)) / splitValue
        let billPerPerson = billTotal / splitValue
        return billPerPerson + tipPerPerson
        
        /*
         var finalBillPerPerson =
            ((billTotal / splitValue) + ((billTotal * (tipValue / 100.0)) / splitValue))
         */
     }
    @IBAction func PressedCalculateButton(_ sender: UIButton) {
        print(calculateBill(tipValue, splitValue, billTotal))
        performSegue(withIdentifier: "ShowBillResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBillResult" {
            let destinationVC = segue.destination as! BillResultViewController
            destinationVC.calculatedBill = calculateBill(tipValue, splitValue, billTotal)
            destinationVC.splitValue = splitValue;
            destinationVC.tipValue = tipValue;
        }
    }
}
