//
//  HomeView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var productListViewModel = ProductListViewModel()
    @State private var searchKey = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading) {
                            Text("Welcome to")
                                .font(.custom("PlayfairDisplay-Regular", size: 25))
                            Text("MyShop")
                                .font(.custom("PlayfairDisplay-Bold", size: 25))
                        }
                        .padding(.horizontal)
                        .foregroundColor(.orange)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 5, alignment: .leading)
                        
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                        
                        VStack {
                            ProductListView(products: productListViewModel.getInStockList(), isOutOfStock: false)
                            if productListViewModel.getOutOfStockList().count > 0 {
                                
                                Text("Out of stock")
                                    .font(.custom("PlayfairDisplay-Bold", size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                
                                ProductListView(products: productListViewModel.getOutOfStockList(), isOutOfStock: true)
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
            .navigationBarHidden(true)
            .background(Color("LightGray"))
            .onAppear {
                productListViewModel.updateProducts()
            }
        }
//        .searchable(text: $searchKey)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
