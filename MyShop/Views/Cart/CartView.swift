//
//  CartView.swift
//  MyShop
//
//  Created by Hieu Le on 3/6/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var userManager = UserManager.shared
    
    var body: some View {
        NavigationView {
            if let user = userManager.currentUser {
                MyCartView(user: user, cartCount: user.cartCount)
            } else {
                LoginView()
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
