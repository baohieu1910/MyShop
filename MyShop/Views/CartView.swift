//
//  CartView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    @State var selectedList: [Bool]
    
    init(user: User, cartCount: Int) {
        self.user = user
        self._selectedList = State(initialValue: [Bool](repeating: false, count: cartCount))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(0..<user.cartCount, id: \.self) { index in
                        CartRowView(product: user.cartList[index], selected: $selectedList[index])
                    }
                }
            }
            .background(Color("LightGray"))
            
            
            VStack {
                HStack {
                    Spacer()
                    Text("Total payment")
                    Text("\(totalPayment().0, specifier: "%.0f")$")
                        .foregroundColor(.orange)
                    
                    Button {
                        purchase()
                        dismiss()
                    } label: {
                        Text("Purchase(\(totalPayment().1))")
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                        
                    }
                }
                .padding(.bottom)
                .background(Color("LightGray"))
            }
        }
        .navigationTitle("Cart")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    func totalPayment() -> (Double, Int) {
        var total = 0.0
        var num = 0
        
        for index in selectedList.indices {
            if selectedList[index] {
                total += user.cartList[index].price
                num += 1
            }
        }
        return (total, num)
    }
    
    func purchase() {
        for index in selectedList.indices {
            if selectedList[index] {
                Utils.addToOderHistory(user: user, product: user.cartList[index])
                Utils.removeFromCart(user: user, product: user.cartList[index])
            }
        }
    }
    
    
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(user: ExampleData.user, cartCount: 1)
    }
}
