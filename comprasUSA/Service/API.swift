//
//  API.swift
//  comprasUSA
//
//  Created by Kleyson on 26/10/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import Foundation
final class API {
    //funçao assincrona, pois o servidor pode demorar para retornar os dados e essa espera é assincrona utilizando o @escaping.
    func fetchMoney(typeMoney: String, completion: @escaping((Money) -> Void) ) {
        let url = URL(string: Endpoints.baseUrl + typeMoney)!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _ , error) in
            if error == nil { // deu certo, sem erro
                let model = try! JSONDecoder().decode(Money.self, from: data!)
                DispatchQueue.main.async {//voltar pra thread principal
                    completion(model)
                }
            }
            else { // imprime o erro
                print(error!)
            }
        }
        dataTask.resume() // da o play na dataTask
    }
}
