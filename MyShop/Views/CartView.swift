//
//  CartView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct CartView: View {
    let user: User
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(user.cartList) { product in
                        CartRowView(product: product)
                            .padding(.bottom)
                    }
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Total payment")
                    Text("0$")
                        .foregroundColor(.orange)
                    
                    Button {
                        
                    } label: {
                        Text("Purchase(0)")
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            
                    }
                }
                .padding(.bottom)
                .background(.white)
            }
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(user: ExampleData.user)
    }
}
