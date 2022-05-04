//
//  Crypto.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 03/05/22.
//

import Foundation

struct Response: Codable{
    var data: [Crypto]
}

struct Crypto: Codable, Hashable{
    let symbol: String?
    let name: String?
    let rank: Int?
    let price_usd: String?
}
