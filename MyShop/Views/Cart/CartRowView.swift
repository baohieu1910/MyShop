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
        ZStack(alignment: .bottomTrailing) {
            Button {
                selected.toggle()
            } label: {
                VStack(spacing: 0) {
                    HStack {
                        Text("\(product.user?.username ?? "N/A")")
                            .font(.system(size: 18, weight: .bold))
                        
                        Spacer()
                    }
                    HStack {
                        product.image?
                        //                        Image("Nike")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth / 4)
                            .scaledToFill()
                            .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 4)
                            .clipped()
                        
                        
                        VStack(alignment: .leading) {
                            Text("\(product.name ?? "N/A")")
                                .font(.system(size: 18, weight: .bold))
                                .lineLimit(1)
                            
                            Text("\(product.price, specifier: "%.0f")$")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("MyColor"))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(selected ? .black : .clear)
                }
            }
            
            HStack {
                Spacer()
                
                Button {
                    if quantity > 1 {
                        quantity -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.screenWidth / 15, height: UIScreen.screenWidth / 15)
                        .background(quantity > 1 ? Color("MyColor") : .clear)
                        .cornerRadius(90)
                        .overlay {
                            Circle()
                                .stroke(quantity > 1  ? .clear : Color("MyColor"))
                        }
                }
                
                
                Text("\(quantity)")
                    .padding(.horizontal, 10)
                
                Button {
                    if quantity < 10 {
                        quantity += 1
                    }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .frame(width: UIScreen.screenWidth / 15, height: UIScreen.screenWidth / 15)
                        .background(quantity < 10 ? Color("MyColor") : .clear)
                        .cornerRadius(90)
                        .overlay {
                            Circle()
                                .stroke(quantity < 10  ? .clear : Color("MyColor"))
                        }
                }
            }
            .padding()
        }
        
    }
}

struct CartRowView_Previews: PreviewProvider {
    static var previews: some View {
        CartRowView(product: ExampleData.product, selected: Binding.constant(true), quantity: Binding.constant(1))
    }
}
