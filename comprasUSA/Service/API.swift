//
//  API.swift
//  comprasUSA
//
//  Created by Kleyson on 26/10/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import Foundation
final class API {
    func fetchMoney(typeMoney: String, completion: @escaping((Money) -> Void) ) {
        let url = URL(string: "https://economia.awesomeapi.com.br/all/USD-BRL")
        let session = URLSession.shared
        var request = URLRequest (url: url!)
        request.addValue ("application/json", forHTTPHeaderField: "Accept")
        session.dataTask(with: url!) { (dataResponse, response, error)
            in
            print(response)
            if error == nil {
                if let data = dataResponse {
                    if let model = try? JSONDecoder().decode(Money.self, from: data) {
                    completion(model)
                    }
                    
                }
            }
            
        }.resume()
    }
}
