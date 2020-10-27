//
//  TaxesCalculator.swift
//  comprasUSA
//
//  Created by Kleyson on 22/10/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import Foundation
final class TaxesCalculator {
    //padrão singleton (devolve a mesma instancia da classe o tempo todo)
    
    static let shared = TaxesCalculator()
    var dolar : Double = 3.5
    var iof : Double = 6.38
    var stateTax : Double = 7
    var shoppingValue : Double = 0
    let formatter = NumberFormatter()
    
    //criar uma variavel computada para retornar o valor em Real na mesma tela
    var shoppingValueInReal: Double {
        return dolar * shoppingValue
    }
    
    var stateTaxValue : Double {
        return shoppingValue * stateTax/100
    }
    
    var iofValue : Double {
        return (shoppingValue + stateTax) * iof/100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTaxValue
        if usingCreditCard { //se o usuario utilizou o cartão de crédito
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func  convertToDouble (_ string: String) -> Double {
        formatter.numberStyle = .none
    return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value : Double, withCurrency currency : String ) -> String {
        formatter.numberStyle = .currency //me retorna o formato de moeda
        formatter.currencySymbol = currency //exibe o simbolo da moeda ora Real, ora dolar
        formatter.alwaysShowsDecimalSeparator = true // sempre exibe com 2 casa decimais
        return formatter.string(for: value)!
    }
    
    
    private init () { //manter o construtor privado na classe
        formatter.usesGroupingSeparator = true
    }
    
}
