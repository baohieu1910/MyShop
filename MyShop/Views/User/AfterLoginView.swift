//
//  AfterLoginView.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import SwiftUI

struct AfterLoginView: View {
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var userListViewModel = UserListViewModel()
    let user: User
    
    init(user: User) {
        self.user = user
        userListViewModel.updateUsers()
        userListViewModel.updateProductCart(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
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
                            
                            Text("Member")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
                .background(.orange)
                
                VStack {
                    NavigationLink {
                        MyProductView(user: user)
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet.rectangle.portrait")
                                .font(.system(size: 20))
                                .padding(.trailing, 10)
                            
                            Text("My product")
                            
                            Spacer()
                        }
                        .padding(10)
                        .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "list.bullet.rectangle.portrait")
                                .font(.system(size: 20))
                                .padding(.trailing, 10)
                            
                            Text("Order history")
                            
                            Spacer()
                        }
                        .padding(10)
                        .foregroundColor(.black)
                    }
                    
                    Divider()
                }
                
                HStack {
                    VStack {
                        Image(systemName: "wallet.pass")
                        
                        Text("Delivering")
                            .lineLimit(2)
                    }
                    .frame(width: UIScreen.screenWidth / 4)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "car")
                        
                        Text("Delivered")
                            .lineLimit(2)
                    }
                    .frame(width: UIScreen.screenWidth / 4)
                }
                .padding(10)
                .foregroundColor(.gray)

                
                Divider()
            }
            .ignoresSafeArea()
            
            Button {
                userManager.logout()
            } label: {
                Text("Log Out")
                    .padding(.vertical)
                    .padding(.horizontal, UIScreen.screenWidth / 3)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(90)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    CartView(user: user, cartCount: user.cartCount)
                } label: {
                    Image(systemName: "cart")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct AfterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AfterLoginView(user: ExampleData.user)
    }
}
