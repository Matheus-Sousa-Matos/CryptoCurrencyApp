//
//  Service.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 03/05/22.
//

import Foundation

//MARK: - Service API Singleton
public final class Service {
    
    static let shared = Service()
    private let url = "https://api.coinlore.net/api/tickers"
    
    func fetchCrypto(completion: @escaping (Response) -> ()) {
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let data = data {
                let decoder = JSONDecoder()
                do{
                    let res = try decoder.decode(Response.self, from: data)
                    
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
