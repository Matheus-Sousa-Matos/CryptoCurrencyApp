//
//  USDBRL.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 05/05/22.
//

import Foundation

struct ResponseUSDBRL: Codable{
    var USDBRL: USDBRLConversion
}

struct USDBRLConversion: Codable{
    var low: String
}
