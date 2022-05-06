//
//  CryptoViewModel.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 03/05/22.
//
//MARK: - VIEWMODEL

import Foundation

protocol USDBRLConversionProtocol{
    func getPriceUSDBRL()
}

public class CryptoViewModel: ObservableObject, USDBRLConversionProtocol{
    @Published var priceUSDBRL: Double = 0.0
    @Published var priceBRL: String = "0.0"
    @Published var cryptos: [Crypto] = []
    
    init(){
        getPriceUSDBRL()
    }
   
    public func refresh(){
        self.priceBRL = "0.0"
        Service.shared.fetchCrypto { (response) in
            self.cryptos = response.data
        }
    }
    
    public func getPriceUSDBRL() {
        ServiceCurrencyConversion.shared.fetchPriceUSDBRL { USDBRLConversion in
            self.priceUSDBRL = (USDBRLConversion.USDBRL.low as NSString).doubleValue
        }
    }
    
    public func convertCoin(usdCoin: String){
        let quotation = (usdCoin as NSString).doubleValue * priceUSDBRL
        let priceBrConvertDouble = quotation
        self.priceBRL = String(format: "%.2f", priceBrConvertDouble)
    }
    
    
   
    
}
