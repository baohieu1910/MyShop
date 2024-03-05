//
//  ShopDetailView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct ShopDetailView: View {
    @ObservedObject var userListViewModel = UserListViewModel()
    let user: User
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    VStack {
                        HStack {
                            Text("")
                                .padding(20)
                        }
                        
                        HStack {
                            Image(systemName: "person.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.orange)
                                .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
                                .background(.white)
                                .cornerRadius(90)
                                .padding([.vertical, .leading])
                            
                            VStack(alignment: .leading) {
                                Text("\(user.username?.uppercased() ?? "")")
                                    .font(.title)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                    .background(.orange)
                    
                    Divider()
                    
                    HStack {
                        Text("Latest")
                            .frame(width: UIScreen.screenWidth / 4)
                        
                        Divider()
                        
                        Text("Bestseller")
                            .frame(width: UIScreen.screenWidth / 4)
                        Divider()
                        
                        HStack {
                            Text("Price")
                            
                            Image(systemName: "arrow.down")
                        }
                        .frame(width: UIScreen.screenWidth / 4)
                    }
                    .padding(10)
                    
                    Divider()
                    
                    VStack {
                        ProductListView(products: userListViewModel.getUserOutOfStock(user: user), isOutOfStock: false)
                        
                        Text("Out of stock")
                        
                        ProductListView(products: userListViewModel.getUserInStock(user: user), isOutOfStock: true)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .background(Color("LightGray"))
        .onAppear {
            userListViewModel.updateUsers()
        }
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(user: ExampleData.user)
    }
}
