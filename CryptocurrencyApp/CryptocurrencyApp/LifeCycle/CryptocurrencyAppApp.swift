//
//  CryptocurrencyAppApp.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 29/04/22.
//

import SwiftUI

@main
struct CryptocurrencyAppApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoView()
                .environmentObject(CryptoViewModel())
        }
    }
}
