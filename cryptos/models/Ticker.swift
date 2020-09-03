//
//  Ticker.swift
//  cryptos
//
//  Created by fredy puente on 02-09-20.
//  Copyright © 2020 fredy puente. All rights reserved.
//

import UIKit

struct Ticker: Decodable {
    var timestamp: String
    var market: String
    var bid: String
    var ask: String
    var last_price: String
    var low: String
    var high: String
    var volume: String

}
