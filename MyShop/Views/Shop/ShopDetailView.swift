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
                
                ProductListView(products: userListViewModel.getUser(user: user).productsList, isOutOfStock: false)
                
            }
            .ignoresSafeArea()
        }
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
