//
//  MyProductView.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import SwiftUI

struct MyProductView: View {
    @ObservedObject var productListViewModel = ProductListViewModel()
    let user: User
    
    var body: some View {
        VStack {
            ProductListView(products: user.productsList)
            
            HStack {
                Spacer()
                
                NavigationLink {
//                    productListViewModel.addProduct(user: user, name: "Sneaker", detail: "", imageName: "NB550", price: 250)
                    AddProductView(productListViewModel: productListViewModel, user: user)
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: UIScreen.screenWidth / 6, height: UIScreen.screenWidth / 6)
                        .background(.orange)
                        .cornerRadius(90)
                        .padding(.horizontal)
                }
            }
        }
    }
}

struct MyProductView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductView(user: ExampleData.user)
    }
}
