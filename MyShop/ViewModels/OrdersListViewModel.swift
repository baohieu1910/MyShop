//
//  OrdersListViewModel.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import Foundation
class OrdersListViewModel: ObservableObject {
    @Published var orders = [Order]()
    
    init() {
        orders = [
            Order(name: "Giày Nike Wmns Air Jordan 1 Low ‘White Wolf Grey’ DC0774-105", imageName: "Nike", price: 200),
            Order(name: "Giày Thể Thao New Balance 550 White Green BB550WT1 Màu Trắng Xanh Size 41.5", imageName: "NB550", price: 300),
            Order(name: "Giày Thể Thao Nam Reebok Club C Revenge Vintage", imageName: "Reebok", price: 75),
            Order(name: "GIÀY ADIDAS FORUM LOW #DARK GREEN", imageName: "Forum", price: 150),
            Order(name: "Giày adidas Samba OG ‘White Black Gum’ B75806", imageName: "Samba", price: 125)
        ]
    }
}
