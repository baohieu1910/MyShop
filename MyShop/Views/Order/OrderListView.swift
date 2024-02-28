//
//  OrderListView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct OrderListView: View {
    @ObservedObject var ordersListViewModel = OrdersListViewModel()
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(ordersListViewModel.orders) { order in
                    OrderCardView(order: order)
                    
                }
            }
        }
        .padding(.horizontal)
        
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
