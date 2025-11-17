//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class BillCalcViewController: UIViewController {

    // Input field
    @IBOutlet weak var BillTotalInputField: UITextField!
    
    // Select Tip Buttons
    @IBOutlet weak var zeroPerTipButton: UIButton!
    @IBOutlet weak var tenPerTipButton: UIButton!
    @IBOutlet weak var twentyPerTipButton: UIButton!
    
    // Split Number
    @IBOutlet weak var SplitValueLabel: UILabel!
    
    // Init Objects
    var bill: Bill = Bill(total: 0.0, tipPercent: 0.0, splitValue: 0.0);
    let billCalculator = BillCalcLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillTotalInputField.keyboardType = .decimalPad
        hideKeyboardWhenTappedAround()
        tenPerTipButton.isSelected = true;
    }

    @IBAction func PressedInputField(_ sender: UITextField) {
        BillTotalInputField.text = sender.text
        bill.total = Double(BillTotalInputField.text!) ?? 0.0
    }
    
    
    @IBAction func PressedTipButton(_ sender: UIButton) {
        zeroPerTipButton.isSelected = false
        tenPerTipButton.isSelected = false
        twentyPerTipButton.isSelected = false
        sender.isSelected = true
        
        switch sender {
            case zeroPerTipButton:
                bill.tipPercent = 0.0
            case tenPerTipButton:
                bill.tipPercent = 10.0
            case twentyPerTipButton:
                bill.tipPercent = 20.0
            default:
                bill.tipPercent = 0.0
        }
        
        print(bill.tipPercent);
    }
    
    @IBAction func SplitValueStepperChanged(_ sender: UIStepper) {
        bill.splitValue = Double(sender.value);
        SplitValueLabel.text = "\(Int(sender.value))";
        
        print(bill.splitValue)
    }
    
    @IBAction func PressedCalculateButton(_ sender: UIButton) {        performSegue(withIdentifier: "ShowBillResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBillResult" {
            let destinationVC = segue.destination as! BillResultViewController
            destinationVC.calculatedBill = billCalculator.calculateBill(bill.tipPercent, bill.splitValue, bill.total)
            destinationVC.splitValue = bill.splitValue;
            destinationVC.tipValue = bill.tipPercent;
        }
    }
}
