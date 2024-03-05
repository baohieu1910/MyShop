//
//  AllProductListView.swift
//  MyShop
//
//  Created by Hieu Le on 3/5/24.
//

import SwiftUI

struct AllProductListView: View {
    @ObservedObject var productListViewModel = ProductListViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ProductListView(products: productListViewModel.getInStockList(), isOutOfStock: false)
                
                Text("Out of stock")
                
                ProductListView(products: productListViewModel.getOutOfStockList(), isOutOfStock: true)
            }
        }
        .background(Color("LightGray"))
    }
}

struct AllProductListView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductListView()
    }
}
