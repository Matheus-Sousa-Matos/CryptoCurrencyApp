//
//  CryptoViewModel.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 03/05/22.
//
//MARK: - VIEWMODEL

import Foundation

public class CryptoViewModel: ObservableObject{

//    @Published var nameCrypto: String = "No data"
//    @Published var symbolCrypto: String = "No data"
//    @Published var priceUsdCrypto: String = "No data"
    @Published var cryptos: [Crypto] = []
   
    public func refresh(){
        Service.shared.fetchCrypto { (response) in
            self.cryptos = response.data
        }
    }
    
}
