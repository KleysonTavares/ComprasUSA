//
//  Money.swift
//  comprasUSA
//
//  Created by Kleyson on 26/10/2020.
//  Copyright © 2020 Kleyson. All rights reserved.
//

import Foundation
struct Money: Codable {
    let USD : USD?
}

struct USD: Codable {
    let code : String?
    let codein : String?
    let name : String?
    let high : String?
    let low : String?
    let varBid : String?
    let pctChang : String?
    let bid : String?
    let ask : String?
    let timestamp : String?
    let create_date : String?
}
