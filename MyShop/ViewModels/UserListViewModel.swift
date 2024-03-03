//
//  UserListViewModel.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    private var productListViewModel = ProductListViewModel()
    
    init() {
        getAllUsers()
    }

}

extension UserListViewModel {
    func getAllUsers() {
        users = CoreDataManager.shared.getAllUsers()
    }
    
    func addUser(username: String, password: String) {
        let newUser = User(context: CoreDataManager.shared.viewContext)
        
        newUser.id = UUID()
        newUser.username = username
        newUser.password = password
        
        CoreDataManager.shared.saveContext()
        getAllUsers()
    }
    
    func updateUsers() {
        CoreDataManager.shared.saveContext()
        getAllUsers()
    }
    
    func checkLogin(username: String, password: String) -> Bool {
        for user in users {
            if user.username?.uppercased() == username.uppercased() && user.password == password {
                return true
            }
        }
        
        return false
    }
    
    func checkUsername(username: String) -> Bool {
        for user in users {
            if username.uppercased() == user.username?.uppercased() {
                return true
            }
        }
        
        return false
    }
    
    func updateProducts(user: User) {
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                let productsSet = user.products as? Set<Product> ?? []
                let newProducts = user_.products?.addingObjects(from: productsSet)
                user_.products = NSSet(set: newProducts ?? [])
            }
        }
        updateUsers()
    }
    
    func getUser(user: User) -> User {
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                return user_
            }
        }
        
        return user
    }
}
