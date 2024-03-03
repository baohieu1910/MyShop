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
            ProductListView(products: productListViewModel.products)
        }
        .onAppear {
            productListViewModel.updateProducts()
        }
        .searchable(text: $searchKey)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
