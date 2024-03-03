//
//  CartRowView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct CartRowView: View {
    let product: Product
    @State var quantity = 1
    var body: some View {
        HStack {
            product.image?
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth / 4)
                .scaledToFill()
                .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("\(product.name ?? "N/A")")
                    .lineLimit(1)
                
                Text("$\(product.price, specifier: "%.0f")")
                    .font(.system(size: 20))
                    .foregroundColor(.orange)
                    
                
                Stepper(value: $quantity, in: 1...10) {
                    Text("Quantity: \(quantity)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartRowView(product: ExampleData.product)
    }
}
