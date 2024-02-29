//
//  UserView.swift
//  MyShop
//
//  Created by Hieu Le on 2/29/24.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var userListViewModel = UserListViewModel()
    @ObservedObject var userManager = UserManager.shared
    
    var body: some View {
        if let user = userManager.currentUser {
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .font(.system(size: 50))
                            .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
                            .background(.gray)
                            .cornerRadius(90)
                            .padding()
                        
                        VStack {
                            Text("\(user.username?.uppercased() ?? "")")
                                .font(.title)
                            
                        }
                        
                        Spacer()
                    }

                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "clock.arrow.circlepath")

                            Text("History")
                        }
                        .font(.system(size: 18))
                    }
                    
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
            .padding()
            .onAppear {
                userListViewModel.updateUsers()
            }
            .navigationTitle("User")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            LoginView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
