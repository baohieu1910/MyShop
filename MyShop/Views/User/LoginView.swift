//
//  LoginView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct LoginView: View {
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Text("Login to your account")
                .font(.system(size: 30, weight: .bold))
            
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.orange)
                        
                        TextField("Username", text: $username)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                        
                    }
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.orange)
                        
                        SecureField("Password", text: $password)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                    }
                }
                .padding(.bottom)
                
            }
            
            HStack {
                Text("Already have an account?")
                
                NavigationLink {
//                    RegisterView(userListViewModel: userListViewModel)
                    RegisterView()
                } label: {
                    Text("Sign up")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
