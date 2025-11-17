//
//  BillResultViewController.swift
//  Tipsy
//
//  Created by Diogo Henriques on 17/11/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class BillResultViewController: UIViewController {

    var tipValue: Double = 10.0;
    var splitValue: Double = 2.0;
    var calculatedBill: Double = 0.0;
    
    @IBOutlet weak var calculatedBillLabel: UILabel!
    @IBOutlet weak var splitInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatedBillLabel.text = String(format: "%.2f", calculatedBill)
        splitInfoLabel.text = "Split between \(Int(splitValue)) people, with \(String(format: "%.0f", tipValue))% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
            dismiss(animated: true)
    }
}

