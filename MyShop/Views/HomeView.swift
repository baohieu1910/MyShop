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
                    VStack(spacing: 0) {
                        VStack {

                        }
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 5)
                        .background(.orange)
                        
                        Text("Popular")
                            .font(.title2)
//                            .font(.custom("PlayfairDisplay-Regular", size: 25))
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                        
                        VStack {
                            ProductListView(products: productListViewModel.getInStockList(), isOutOfStock: false)
                            if productListViewModel.getOutOfStockList().count > 0 {
                                
                                Text("Out of stock")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(10)
                                
                                ProductListView(products: productListViewModel.getOutOfStockList(), isOutOfStock: true)
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.top)
            }
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
