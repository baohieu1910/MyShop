//
//  MyCartView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct MyCartView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var productListViewModel = ProductListViewModel()
    let user: User
    @State var selectedList: [Bool]
    @State var quantityList: [Int]
    
    init(user: User, cartCount: Int) {
        self.user = user
        self._selectedList = State(initialValue: [Bool](repeating: false, count: cartCount))
        self._quantityList = State(initialValue: [Int](repeating: 1, count: cartCount))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(0..<user.cartCount, id: \.self) { index in
                        CartRowView(product: user.cartList[index], selected: $selectedList[index], quantity: $quantityList[index])
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
                if index < user.cartList.count {
                    total += user.cartList[index].price*Double(quantityList[index])
                    num += 1
                }
            }
        }
        return (total, num)
    }
    
    func purchase() {
        for index in selectedList.indices {
            if selectedList[index] {
                productListViewModel.getProduct(product: user.cartList[index]).purchase(quantities: quantityList[index])
                Utils.addToOderHistory(user: user, product: user.cartList[index])
                Utils.removeFromCart(user: user, product: user.cartList[index])
            }
        }
    }
    
    
    
}

struct MyCartView_Previews: PreviewProvider {
    static var previews: some View {
        MyCartView(user: ExampleData.user, cartCount: 1)
    }
}
