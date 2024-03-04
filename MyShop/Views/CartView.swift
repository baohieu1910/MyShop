//
//  CartView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct CartView: View {
    let user: User
    @State var selectedList: [Bool]
    
    init(user: User, cartCount: Int) {
        self.user = user
        self.selectedList = [Bool](repeating: false, count: cartCount)
    }
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    //                    ForEach(user.cartList) { product in
                    //                        CartRowView(product: product, selected: Binding.constant(false))
                    //                    }
                    ForEach(0..<user.cartCount, id: \.self) { index in
                        CartRowView(product: user.cartList[index], selected: $selectedList[index])
                    }
                }
            }
            .background(Color("LightGray"))
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Total payment")
                    Text("\(totalPayment().0, specifier: "%.0f")$")
                        .foregroundColor(.orange)
                    
                    Button {
                        
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
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(user: ExampleData.user, cartCount: 1)
    }
}
