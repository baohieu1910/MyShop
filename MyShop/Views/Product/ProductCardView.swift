//
//  ProductCardView.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack {
            Image("\(product.imageName ?? "N/A")")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth / 2 - 20, height: UIScreen.screenWidth / 2 - 20)
            Text("\(product.name ?? "N/A")")
                .lineLimit(2)
            
            Text("$\(product.price, specifier: "%.0f")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20))
        }
        .foregroundColor(.black)
    }
}

//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView()
//    }
//}
