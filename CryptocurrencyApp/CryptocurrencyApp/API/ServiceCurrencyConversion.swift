//
//  ServiceCurrencyConversion.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 05/05/22.
//

import Foundation

//MARK: - Service API Currency Conversion
public final class ServiceCurrencyConversion {
    
    static let shared = ServiceCurrencyConversion()
    private let url = "https://economia.awesomeapi.com.br/json/last/USD-BRL/"
    
    func fetchPriceUSDBRL(completion: @escaping (ResponseUSDBRL) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                let decoder = JSONDecoder()
                do{
                    let res = try decoder.decode(ResponseUSDBRL.self, from: data)
                    DispatchQueue.main.async {
                        completion(res)
                    }
                    
                }
                catch{
                    print(error)
                }
            }
            
        }).resume()
    }
    
    
}

