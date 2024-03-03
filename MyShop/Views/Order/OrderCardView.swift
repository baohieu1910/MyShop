//
//  OrderCardView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct OrderCardView: View {
    let order: Order
    
    var body: some View {
        VStack {
            Image("\(order.imageName ?? "N/A")")
                .resizable()
                .scaledToFit()
                .scaledToFill()
                .frame(width: UIScreen.screenWidth / 2 - 20, height: UIScreen.screenWidth / 2 - 20)
                .clipped()
            Text("\(order.name ?? "N/A")")
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("$\(order.price ?? 0.0, specifier: "%.0f")")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20))

        }
//        .frame(height: UIScreen.screenHeight / 2)
    }
}

struct OrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            OrderCardView(order: Order(name: "Giày adidas Samba OG ‘White Black Gum’ B75806", imageName: "Nike", price: 125))
            
            OrderCardView(order: Order(name: "Giày adidas Samba OG ‘White Black Gum’ B75806", imageName: "Nike", price: 125))
        }
    }
}
