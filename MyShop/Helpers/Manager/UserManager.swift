//
//  UserManager.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import SwiftUI
import Foundation

class UserManager: ObservableObject {
    static var shared = UserManager()
    @Published var currentUser: User? = nil
    
}
    
extension UserManager {
    func login(user: User) {
        currentUser = user
    }
    
    func logout() {
        currentUser = nil
    }
}

private extension UserManager {
    
}

