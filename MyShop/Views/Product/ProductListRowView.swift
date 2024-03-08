//
//  ProductListRowView.swift
//  MyShop
//
//  Created by Hieu Le on 3/9/24.
//

import SwiftUI

struct ProductListRowView: View {
    let products: [Product]
    let isOutOfStock: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductCardView(product: product, isOutOfStock: isOutOfStock)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProductListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListRowView(products: [], isOutOfStock: false)
    }
}
