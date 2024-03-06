//
//  UserListViewModel.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        getAllUsers()
    }

}

extension UserListViewModel {
    func getAllUsers() {
        users = CoreDataManager.shared.getAllUsers()
    }
    
    func deteleAllUser() {
        for user in users {
            CoreDataManager.shared.deleteUser(user: user)
        }
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
    
    func updateProductCart(user: User) {
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                let cartSet = user.cart as? Set<Product> ?? []
                let newCart = user_.cart?.addingObjects(from: cartSet)
                user_.cart = NSSet(set: newCart ?? [])
            }
        }
        updateUsers()
    }
    
    func updateOrderHistory(user: User) {
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                let orderSet = user.orderHistory as? Set<Product> ?? []
                let newOrderList = user_.orderHistory?.addingObjects(from: orderSet)
                user_.orderHistory = NSSet(set: newOrderList ?? [])
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
    
    func getUser(username: String) -> User? {
        for user_ in users {
            if user_.username?.uppercased() == username.uppercased() {
                return user_
            }
        }
        
        return nil
    }
    
    func getUserOutOfStock(user: User) -> [Product] {
        var productList = [Product]()
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                for product in user.productsList {
                    if product.checkOutOfStock() {
                        productList.append(product)
                    }
                }
                return productList
            }
        }
        return productList
    }
    
    func getUserInStock(user: User) -> [Product] {
        var productList = [Product]()
        for user_ in users {
            if user_.username?.uppercased() == user.username?.uppercased() {
                for product in user.productsList {
                    if !product.checkOutOfStock() {
                        productList.append(product)
                    }
                }
                return productList
            }
        }
        return productList
    }
}
