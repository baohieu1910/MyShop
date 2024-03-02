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
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "person")
                        .font(.system(size: 50))
                        .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
                        .background(.orange)
                        .cornerRadius(90)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("\(user.username?.uppercased() ?? "")")
                            .font(.title)
                        
                        Text("Member")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                
                Divider()
                
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
                        .padding()
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
                        .padding()
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
                .padding()
                .foregroundColor(.gray)

                
                Divider()
            }
            
            Spacer()
            
            Button {
                userManager.logout()
            } label: {
                Text("Log Out")
                    .padding(.vertical)
                    .padding(.horizontal, UIScreen.screenWidth / 3)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(10)
            }
        }
        .ignoresSafeArea(.all)
        .padding()
        .onAppear {
            userListViewModel.updateUsers()
        }
    }
}

struct AfterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AfterLoginView(userManager: UserManager(), userListViewModel: UserListViewModel(), user: ExampleData.user)
    }
}
