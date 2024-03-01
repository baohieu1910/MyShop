//
//  UserView.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var userManager = UserManager.shared
    
    var body: some View {
        if let user = userManager.currentUser {
            AfterLoginView(user: user)
        } else {
            LoginView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
