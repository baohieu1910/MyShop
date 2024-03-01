//
//  ProductListViewModel.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    
    init() {
        getAllProducts()
    }
    
}

extension ProductListViewModel {
    func getAllProducts() {
        products = CoreDataManager.shared.getAllProducts()
    }
    
    func addProduct(user: User, name: String, detail: String, imageName: String, price: Double) {
        let newProduct = Product(context: CoreDataManager.shared.viewContext)
        
        newProduct.id = UUID()
        newProduct.name = name
        newProduct.detail = detail
        newProduct.imageName = imageName
        newProduct.price = price
        newProduct.isSold = false
        
        user.addToProducts(newProduct)
        CoreDataManager.shared.saveContext()
        getAllProducts()
    }
    
    
}

