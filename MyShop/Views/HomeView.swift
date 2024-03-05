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
            ScrollView {
                VStack {
                    ProductListView(products: productListViewModel.getInStockList(), isOutOfStock: false)
                    
                    Text("Out of stock")
                    
                    ProductListView(products: productListViewModel.getOutOfStockList(), isOutOfStock: true)
                }
            }
            .background(Color("LightGray"))
        }
        .onAppear {
            productListViewModel.updateProducts()
        }
//        .searchable(text: $searchKey)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
