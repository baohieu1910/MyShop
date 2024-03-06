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
                        
                        Text("Suggestion today")
                            .font(.title2)
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                        
                        VStack {
                            ProductListView(products: productListViewModel.getInStockList(), isOutOfStock: false)
                            
                            Text("Out of stock")
                            
                            ProductListView(products: productListViewModel.getOutOfStockList(), isOutOfStock: true)
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
