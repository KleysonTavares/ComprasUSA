//
//  SettingViewController.swift
//  comprasUSA
//
//  Created by Kleyson on 21/09/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import UIKit

final class SettingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStatesTaxes: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfDolar.text = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        tfIOF.text = tc.getFormattedValue(of: tc.iof, withCurrency: "")
        tfStatesTaxes.text = tc.getFormattedValue(of: tc.stateTax, withCurrency: "")
        tabBarItem.image = UIImage(named: "settings")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setValues() {
        tc.dolar = tc.convertToDouble(tfDolar.text!)
        tc.iof = tc.convertToDouble(tfIOF.text!)
        tc.stateTax = tc.convertToDouble(tfStatesTaxes.text!)
    }
}

//estender para aplicar protoclo do uiviewcontroller
extension SettingViewController : UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) { //sempre que sair de uma textfield
        setValues()
    }
}
