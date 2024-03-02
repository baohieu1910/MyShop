//
//  ProductListView.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import SwiftUI

struct ProductListView: View {
    let products: [Product]
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductCardView(product: product)
                    }
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: [])
    }
}
