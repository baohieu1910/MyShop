//
//  MyProductView.swift
//  MyShop
//
//  Created by Hieu Le on 3/1/24.
//

import SwiftUI

struct MyProductView: View {
    @ObservedObject var productListViewModel = ProductListViewModel()
    @ObservedObject var userListViewModel = UserListViewModel()
    let user: User
    
    var body: some View {
        ZStack {
            ProductListView(products: user.productsList, isOutOfStock: false)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        AddProductView(productListViewModel: productListViewModel, user: user)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: UIScreen.screenWidth / 6, height: UIScreen.screenWidth / 6)
                            .background(Color("MyColor"))
                            .cornerRadius(90)
                            .padding()
                    }
                }
            }
        }
        .background(Color("LightGray"))
        .navigationTitle("My products")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MyProductView_Previews: PreviewProvider {
    static var previews: some View {
        MyProductView(user: ExampleData.user)
    }
}
