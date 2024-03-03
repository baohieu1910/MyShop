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
            product.image?
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: UIScreen.screenWidth / 2 - 15, height: UIScreen.screenWidth / 2 - 20)
                .clipped()
            
            VStack {
                Text("\(product.name ?? "N/A")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
                
                Text("$\(product.price, specifier: "%.0f")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .foregroundColor(.orange)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 10)
        .background(.white)
        .foregroundColor(.black)
    }
}

//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView()
//    }
//}
