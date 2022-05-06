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
            VStack(alignment: .center) {
                DataView()
            }
            .onAppear {
                cryptoViewModel.refresh()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .background(.white)

        }
    }
}

struct DataView: View{
    
    @EnvironmentObject var cryptoViewModel: CryptoViewModel
    
    var body: some View{
        //MARK: - List Cryptos
        
        List{
            Text("Cryptocurrency")
                .font(.system(
                    size: 32,
                    weight: .bold,
                    design: .rounded
                ))
                .padding()
                .foregroundColor(.black)
                .listRowInsets(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                .listRowBackground(Color.white)
            
            //Caso necessidade de alterar os dados seguir o modelo a seguir usando o index.
            //Caso somente mostrar os dados utilizar somente var sem a necessidade de @Binding ou o próprio index.
            ForEach(cryptoViewModel.cryptos.indices, id: \.self) { cryptoIndex in
                
                NavigationLink {
                    CryptoInfoView(crypto: $cryptoViewModel.cryptos[cryptoIndex])
                        .environmentObject(cryptoViewModel)
                    
                } label: {
                    VStack(alignment: .leading, spacing: 5){
                        HStack {
                            Text(cryptoViewModel.cryptos[cryptoIndex].name ?? "")
                                .font(.system(
                                    size: 18,
                                    weight: .bold,
                                    design: .rounded
                                ))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            HStack(spacing: 1){
                                Text("$\(cryptoViewModel.cryptos[cryptoIndex].price_usd   ?? "")")
                                    .font(.system(
                                        size: 15,
                                        weight: .bold,
                                        design: .rounded
                                    ))
                                    .foregroundColor(.black)
                                
                                Text(" USD  ")
                                    .font(.system(
                                        size: 8,
                                        weight: .light,
                                        design: .rounded
                                    ))
                                    .padding(.top, 5)
                                    .foregroundColor(.black)
                            }
                          
                        }
                        
                        HStack{
                            Text(cryptoViewModel.cryptos[cryptoIndex].symbol ?? "")
                                .font(.system(
                                    size: 15,
                                    weight: .light,
                                    design: .rounded
                                ))
                                .foregroundColor(.black)

                            Spacer()
                            
                            if (cryptoViewModel.cryptos[cryptoIndex].percent_change_24h! as NSString).doubleValue > 0{
                                Text("\(cryptoViewModel.cryptos[cryptoIndex].percent_change_24h ?? "")%")
                                    .font(.system(
                                        size: 15,
                                        weight: .light,
                                        design: .rounded
                                    ))
                                    .foregroundColor(.green)
                            }
                            else{
                                Text("\(cryptoViewModel.cryptos[cryptoIndex].percent_change_24h ?? "")%")
                                    .font(.system(
                                        size: 15,
                                        weight: .light,
                                        design: .rounded
                                    ))
                                    .foregroundColor(.red)
                            }
                            
                        }
                      
                    }
                }

            }
            .listRowBackground(Color.white)

        }
        .listStyle(GroupedListStyle())
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
    
}

struct CryptoInfoView: View {
    @EnvironmentObject var cryptoViewModel: CryptoViewModel
    @Binding var crypto: Crypto
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            VStack(alignment: .leading){
                Text(crypto.name ?? "")
                    .font(.system(
                        size: 21,
                        weight: .bold,
                        design: .rounded
                    ))
                    .foregroundColor(.black)
                
                Text(crypto.symbol ?? "")
                    .font(.system(
                        size: 18,
                        weight: .light,
                        design: .rounded
                    ))
                    .foregroundColor(.black)
                    
                HStack(spacing: 1){
                    Text("$\(crypto.price_usd ?? "")")
                        .font(.system(
                            size: 32,
                            weight: .light,
                            design: .rounded
                        ))
                        .foregroundColor(.black)
                    
                    Text(" USD  ")
                        .font(.system(
                            size: 21,
                            weight: .light,
                            design: .rounded
                        ))
                        .padding(.top, 5)
                        .foregroundColor(.black)
                }
            }
            .padding(.trailing, 120)
            .padding(.leading, 15)
         
            Spacer()
            
            VStack(alignment: .leading ){
                
                Text("Market Stats")
                    .font(.system(
                        size: 21,
                        weight: .bold,
                        design: .rounded
                    ))
                    .foregroundColor(.black)
                
                HStack{
                    Text("Rank")
                    Spacer()
                    Text("\(String(crypto.rank!))ºn")
                }
                
                HStack{
                    Text("BRL Price")
                    Spacer()
                    Text(" R$\(cryptoViewModel.priceBRL)")
                }
                
                HStack{
                    Text("Volume (24h)")
                    Spacer()
                    Text("$\( String(format: "%.2f", crypto.volume24!) )USD")
                }
                
                if (crypto.percent_change_7d! as NSString).doubleValue > 0{
                    
                    HStack{
                        Text("Percent 7 Days ")
                        Spacer()
                        Text( "\(crypto.percent_change_7d ?? "")%")
                            .foregroundColor(.green)
                    }

                }
                else{
                    
                    HStack{
                        Text("Percent 7 Days")
                        Spacer()
                        Text( "\(crypto.percent_change_7d ?? "")%")
                            .foregroundColor(.red)
                    }
                    
                }
                
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.white)
        .onAppear {
            cryptoViewModel.convertCoin(usdCoin: crypto.price_usd ?? "")
        }
        
    }
    
}


