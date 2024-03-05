//
//  OrderHistoryView.swift
//  MyShop
//
//  Created by Hieu Le on 3/5/24.
//

import SwiftUI

struct OrderHistoryView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(user.orderHistoryList) { product in
                    OrderHistoryRowView(product: product)
                }
            }
        }
        .background(Color("LightGray"))
        .navigationTitle("Order history")
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView(user: ExampleData.user)
    }
}