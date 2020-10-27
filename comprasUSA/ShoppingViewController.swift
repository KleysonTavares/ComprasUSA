//
//  ViewController.swift
//  comprasUSA
//
//  Created by Kleyson on 21/09/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount() //para definir a quantia em reais
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }

    func setAmmount() {
        let value = tfDolar.text!.isEmpty ? "0" : tfDolar.text!
        tc.shoppingValue = tc.convertToDouble(value)
        
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "" )
        lbRealDescription.text = "valor sem impostos (dólar\(dolar))"
    }
}

