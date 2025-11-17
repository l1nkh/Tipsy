//
//  BillCalcLogic.swift
//  Tipsy
//
//  Created by Diogo Henriques on 17/11/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct BillCalcLogic {
    
    func calculateBill(_ tipPercent: Double, _ splitValue: Double, _ billTotal: Double) -> Double {
        let tipPerPerson = (billTotal * (tipPercent / 100.0)) / splitValue
        let billPerPerson = billTotal / splitValue
        return billPerPerson + tipPerPerson
        
        /*
         var finalBillPerPerson =
            ((billTotal / splitValue) + ((billTotal * (tipValue / 100.0)) / splitValue))
         */
     }
}
