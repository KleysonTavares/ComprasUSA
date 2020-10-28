//
//  ViewController.swift
//  comprasUSA
//
//  Created by Kleyson on 21/09/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import UIKit

final class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getMoney(typeMoney: .dolar)
        tabBarItem.image = UIImage(named: "bag")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount() //para definir a quantia em reais
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfDolar.resignFirstResponder()
        setAmmount()
    }
    
    private func setAmmount() {
        let value = tfDolar.text!.isEmpty ? "0" : tfDolar.text!
        tc.shoppingValue = tc.convertToDouble(value)
        
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "" )
        lbRealDescription.text = "valor sem impostos (dólar\(dolar))"
    }
    
    private func getMoney(typeMoney: MoneyTypes) {
        API.fetchMoney(typeMoney: typeMoney) { (model) in
            switch typeMoney {
            case .dolar:
                self.tc.dolar = self.tc.convertToDouble(model.USD?.ask ?? "0")
            case .euro:
                self.tc.dolar = self.tc.convertToDouble(model.EUR?.ask ?? "0")
            }
        }
    }
}
