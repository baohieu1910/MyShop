//
//  ProductCardView.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    let isOutOfStock: Bool
    
    var body: some View {
        VStack {
            ZStack {
                product.image?
//                Image("Nike")
                    .resizable()
                    .scaledToFit()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth / 2 - 15, height: UIScreen.screenWidth / 2 - 20)
                    .clipped()
                
                if isOutOfStock {
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: UIScreen.screenWidth / 5 - 15, height: UIScreen.screenWidth / 5 - 20)
                            .opacity(0.7)
                        
                        Text("Sold")
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(width: UIScreen.screenWidth / 2 - 15, height: UIScreen.screenWidth / 2 - 20)
            
            VStack {
                Text("\(product.name ?? "N/A")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
                
                HStack {
                    Text("\(product.price, specifier: "%.0f")$")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    Text("Sold \(product.sold)")
                }
            }
            .padding(.horizontal, 10)
        }
        .padding(.bottom, 10)
        .background(.white)
        .foregroundColor(.black)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ProductCardView(product: ExampleData.product, isOutOfStock: false)
            ProductCardView(product: ExampleData.product, isOutOfStock: true)
        }
    }
}
