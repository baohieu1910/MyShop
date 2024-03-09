//
//  RegisterView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color("LightGray")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Create an account")
                    .font(.custom("PlayfairDisplay-Bold", size: 30))

                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(Color("MyColor"))
                            
                            TextField("Username", text: $username)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(checkUserName() ? Color.red : Color.gray, lineWidth: 0.3)
                                )
                            
                        }
                        if checkUserName() {
                            Text("Username too short.")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .italic()
                            
                        } else {
                            if userListViewModel.checkUsername(username: username) {
                                Text("Username has already been taken.")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .italic()
                            } else {
                                Text("A minimum of 4 characters.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(Color("MyColor"))
                            
                            SecureField("Password", text: $password)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(checkPassword() ? Color.red : Color.gray, lineWidth: 0.3)
                                )
                        }
                        
                        if checkPassword() {
                            Text("Password too short.")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .italic()
                        } else {
                            Text("A minimum of 6 characters.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(Color("MyColor"))
                            
                            SecureField("Confirm password", text: $confirmPassword)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(checkConfirmPassword() ? Color.red : Color.gray, lineWidth: 0.3)
                                )
                        }
                        
                        if checkConfirmPassword() {
                            Text("Wrong password.")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .italic()
                            
                        } else {
                            Text("Your confirm password should be the same as password.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.vertical)
                
                if !checkUserName() && !checkPassword() && !checkConfirmPassword() && checkEmpty() && !userListViewModel.checkUsername(username: username) {
                    Button {
                        userListViewModel.addUser(username: username, password: password)
                        
                        dismiss()
                    } label: {
                        Text("Register")
                            .padding(.vertical, 10)
                            .frame(width: UIScreen.screenWidth / 3)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .background(Color("MyColor"))
                            .cornerRadius(90)
                    }
                } else {
                    Text("Register")
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.screenWidth / 3)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(90)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func checkEmpty() -> Bool {
        return username != "" && password != "" && confirmPassword != ""
    }
    
    func checkUserName() -> Bool {
        return username != "" && username.count < 4
    }
    
    func checkPassword() -> Bool {
        return password != "" && password.count < 6
    }
    
    func checkConfirmPassword() -> Bool {
        return password != confirmPassword && password != ""
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userListViewModel: UserListViewModel())
    }
}
