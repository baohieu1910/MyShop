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
                    .font(.system(size: 18, weight: .bold))
                
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
                        .font(.system(size: 18, weight: .bold))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("\(product.price, specifier: "%.0f")$")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("MyColor"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: UIScreen.screenWidth / 4)
        }
        .foregroundColor(.black)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
    }
}

struct OrderHistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryRowView(product: ExampleData.product)
    }
}
