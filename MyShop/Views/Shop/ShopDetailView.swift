//
//  ShopDetailView.swift
//  MyShop
//
//  Created by Hieu Le on 3/3/24.
//

import SwiftUI

struct ShopDetailView: View {
    @ObservedObject var userListViewModel = UserListViewModel()
    @ObservedObject var productListViewModel = ProductListViewModel()
    let user: User
    
    enum ViewStatus {
        case latest
        case bestseller
        case price
    }
    @State var status = ViewStatus.bestseller
    
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
                    .frame(height: UIScreen.screenHeight / 5)
                    .background(.orange)
                    
                    Divider()
                    
                    HStack {
                        Button {
                            status = .latest
                            productListViewModel.byLatest()
                        } label: {
                            Text("Latest")
                                .frame(width: UIScreen.screenWidth / 4)
                                .foregroundColor(status == .latest ? .orange : .gray)
                        }
                        Divider()
                        
                        Button {
                            status = .bestseller
                            productListViewModel.byBestseller()
                        } label: {
                            Text("Bestseller")
                                .frame(width: UIScreen.screenWidth / 4)
                                .foregroundColor(status == .bestseller ? .orange : .gray)
                        }
                        
                        Divider()
                        
                        Button {
                            status = .price
                            productListViewModel.byPrice()
                        } label: {
                            HStack {
                                Text("Price")
                                
                                Image(systemName: "arrow.down")
                            }
                            .frame(width: UIScreen.screenWidth / 4)
                            .foregroundColor(status == .price ? .orange : .gray)
                        }
                    }
                    .padding(10)
                    
                    Divider()
                    
                    VStack {
                        ProductListView(products: productListViewModel.getUserInStock(user: user), isOutOfStock: false)
                        
                        Text("Out of stock")
                        
                        ProductListView(products: productListViewModel.getUserOutOfStock(user: user), isOutOfStock: true)
                        
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .background(Color("LightGray"))
        .onAppear {
            userListViewModel.updateUsers()
            productListViewModel.updateProducts()
        }
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(user: ExampleData.user)
    }
}
