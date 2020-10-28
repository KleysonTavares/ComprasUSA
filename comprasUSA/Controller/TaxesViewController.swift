//
//  TaxesViewController.swift
//  comprasUSA
//
//  Created by Kleyson on 21/09/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import UIKit

final class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbDescriptionTax: UILabel!
    @IBOutlet weak var lbDescriptionIOF: UILabel!
    @IBOutlet weak var lbStatesTax: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(named: "taxes")
    }
    
    func calculateTaxes () {
        lbDescriptionTax.text = "Imposto do estado(\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%) "
            lbIOF.text = "IOF (\(tc.getFormattedValue(of: tc.iof, withCurrency: ""))%) "
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$ ")
        lbStatesTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$ ")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$ ")
        let real = tc.calculate(usingCreditCard: swCreditCard.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$ ")
    }

    @IBAction func changeIOF(_ sender: UISwitch) {
        calculateTaxes()
    }
}
