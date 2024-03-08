//
//  CartRowView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct CartRowView: View {
    let product: Product
    @Binding var selected: Bool
    @Binding var quantity: Int
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("\(product.user?.username ?? "N/A")")
                
                Spacer()
            }
            
            HStack {
                Button {
                    selected.toggle()
                } label: {
                    Image(systemName: selected ? "checkmark.square" : "square")
                        .font(.title2)
                }
                
                product.image?
                //            Image("Nike")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth / 4)
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("\(product.name ?? "N/A")")
                        .lineLimit(1)
                    
                    Text("\(product.price, specifier: "%.0f")$")
                        .font(.system(size: 20))
                        .foregroundColor(Color("MyColor"))
                    
                    
                    Stepper(value: $quantity, in: 1...10) {
                        Text("Quantity: \(quantity)")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundColor(.black)
        .padding(10)
        .background(.white)
        
    }
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartRowView(product: ExampleData.product, selected: Binding.constant(true), quantity: Binding.constant(1))
    }
}
