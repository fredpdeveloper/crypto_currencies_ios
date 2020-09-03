//
//  Tickers.swift
//  cryptos
//
//  Created by fredy puente on 02-09-20.
//  Copyright © 2020 fredy puente. All rights reserved.
//

import UIKit

struct Tickers: Decodable {
  let all: [Ticker]
  
  enum CodingKeys: String, CodingKey {
    case all = "data"
  }
}
