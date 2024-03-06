//
//  ProductListViewModel.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import Foundation
import SwiftUI

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var productsCanBuy = [Product]()
    
    @ObservedObject var userManager = UserManager.shared
    
    init() {
        getAllProducts()
    }
    
}

extension ProductListViewModel {
    func getAllProducts() {
        products = CoreDataManager.shared.getAllProducts().sorted { lhs, rhs in
            lhs.name! < rhs.name!
        }
        var productList = [Product]()
        for product in products {
            if product.user != userManager.currentUser {
                productList.append(product)
            }
        }
        productsCanBuy = productList
    }
    
    func addProduct(user: User, name: String, detail: String, imageData: Data, quantity: Int, price: Double) {
        let newProduct = Product(context: CoreDataManager.shared.viewContext)
        
        newProduct.id = UUID()
        newProduct.name = name
        newProduct.detail = detail
        newProduct.imageData = imageData
        newProduct.quantity = Int32(quantity)
        newProduct.sold = Int32(0)
        newProduct.price = price
        newProduct.date = Date.now
        
        user.addToProducts(newProduct)
        CoreDataManager.shared.saveContext()
        getAllProducts()
    }
    
    func updateProducts() {
        CoreDataManager.shared.saveContext()
        getAllProducts()
    }
    
    func deleteAllProducts() {
        for product in products {
            CoreDataManager.shared.deleteProduct(product: product)
        }
    }
    
    func getProduct(product: Product) -> Product {
        for product_ in products {
            if product.id == product_.id {
                return product_
            }
        }
        return product
    }
    
    func getOutOfStockList() -> [Product] {
        var productList = [Product]()
        for product in productsCanBuy {
            if product.checkOutOfStock() {
                productList.append(product)
            }
        }
        return productList
    }
    
    func getInStockList() -> [Product] {
        var productList = [Product]()
        for product in productsCanBuy {
            if !product.checkOutOfStock() {
                productList.append(product)
            }
        }
        return productList
    }

    func getUserOutOfStock(user: User) -> [Product] {
        var productList = [Product]()
        for product in productsCanBuy {
            if product.checkOutOfStock() {
                if product.user?.username?.uppercased() == user.username?.uppercased() {
                    productList.append(product)
                }
            }
        }
        return productList
    }
    
    func getUserInStock(user: User) -> [Product] {
        var productList = [Product]()
        for product in productsCanBuy {
            if !product.checkOutOfStock() {
                if product.user?.username?.uppercased() == user.username?.uppercased() {
                    productList.append(product)
                }
            }
        }
        return productList
    }
    
    func byLatest() {
        productsCanBuy = productsCanBuy.sorted { lhs, rhs in
            lhs.date ?? Date.now > rhs.date ?? Date.now
        }
        getAllProducts()
    }
    
    func byBestseller() {
        productsCanBuy = productsCanBuy.sorted { lhs, rhs in
            lhs.sold > rhs.sold
        }
        getAllProducts()
    }
    
    func byPrice() {
        productsCanBuy = productsCanBuy.sorted { lhs, rhs in
            lhs.price > lhs.price
        }
        getAllProducts()
    }
}

