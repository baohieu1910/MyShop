//
//  OrderHistoryRowView.swift
//  MyShop
//
//  Created by Hieu Le on 3/5/24.
//

import SwiftUI

struct OrderHistoryRowView: View {
    let product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(product.user?.username ?? "N/A")")
                
                Spacer()
            }
            
            HStack {
                product.image?
//                Image("Nike")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth / 4)
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("\(product.name ?? "N/A")")
                        .lineLimit(2)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("\(product.price, specifier: "%.0f")$")
                            .font(.system(size: 20))
                            .foregroundColor(.orange)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: UIScreen.screenWidth / 4)
        }
        .foregroundColor(.black)
        .padding(10)
        .background(.white)
    }
}

struct OrderHistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryRowView(product: ExampleData.product)
    }
}
