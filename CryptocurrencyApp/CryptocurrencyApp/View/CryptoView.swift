//
//  ContentView.swift
//  CryptocurrencyApp
//
//  Created by Matheus de Sousa Matos on 29/04/22.
//

import SwiftUI

struct CryptoView: View {
    @EnvironmentObject var cryptoViewModel: CryptoViewModel

    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
               DataView()
            }
            .onAppear {
                cryptoViewModel.refresh()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)

        }
    }
}

struct HeaderView: View{
    
    var body: some View{
        //MARK: - Hearders
        HStack(spacing: 12) {
            Text("Name")
                .font(.system(
                    size: 16,
                    weight: .light,
                    design: .rounded
                ))
            
            
            Text("Symbol")
                .font(.system(
                    size: 12,
                    weight: .light,
                    design: .rounded
                ))
            Text("Price(US$)")
                .font(.system(
                    size: 12,
                    weight: .light,
                    design: .rounded
                ))
        }
    }
    
}

struct DataView: View{
    
    @EnvironmentObject var cryptoViewModel: CryptoViewModel
    
    var body: some View{
        //MARK: - List Cryptos
        List{
            Text("Market")
                .font(.system(
                    size: 32,
                    weight: .bold,
                    design: .rounded
                ))
                .padding()
            
            ForEach(cryptoViewModel.cryptos, id: \.self) { crypto in
                VStack(alignment: .leading, spacing: 5){
                    
                    
                    
                    HStack {
                        
                        Text(crypto.name ?? "")
                            .font(.system(
                                size: 18,
                                weight: .bold,
                                design: .rounded
                            ))
                        
                        Spacer()
                        
                     
                        
                        Spacer()
                        HStack(spacing: 1){
                            Text("$\(crypto.price_usd   ?? "")")
                                .font(.system(
                                    size: 15,
                                    weight: .bold,
                                    design: .rounded
                                ))
                            Text(" USD  ")
                                .font(.system(
                                    size: 8,
                                    weight: .light,
                                    design: .rounded
                                ))
                                .padding(.top, 5)
                        }
                      
                    }
                    
                    Text(crypto.symbol ?? "")
                        .font(.system(
                            size: 15,
                            weight: .light,
                            design: .rounded
                        ))
                }
                
                
            }
        }
        .listStyle(.grouped)
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}
