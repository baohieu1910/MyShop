//
//  ContentView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    enum ViewStatus {
        case home
        case cart
        case user
    }
    
    @State var status = ViewStatus.home
    
    var body: some View {
        ZStack {
            switch status {
            case .home:
                HomeView()
            case .cart:
                CartView()
            case .user:
                UserView()
            }
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        status = .home
                    } label: {
                        Image(systemName: status == .home ? "house.fill" : "house")
                            .foregroundColor(status == .home ? Color("MyColor") : .gray)
                            .font(.system(size: 25))
                            .padding(.horizontal, UIScreen.screenWidth / 18)
                    }
                    
                    Button {
                        status = .cart
                    } label: {
                        Image(systemName: status == .cart ? "cart.fill" : "cart")
                            .foregroundColor(status == .cart ? Color("MyColor") : .gray)
                            .font(.system(size: 25))
                            .padding(.horizontal, UIScreen.screenWidth / 18)
                    }
                    
                    Button {
                        status = .user
                    } label: {
                        Image(systemName: status == .user ? "person.fill" : "person")
                            .foregroundColor(status == .user ? Color("MyColor") : .gray)
                            .font(.system(size: 25))
                            .padding(.horizontal, UIScreen.screenWidth / 18)
                    }
                }
                .padding()
                .frame(width: UIScreen.screenWidth * 2 / 3)
                .background(.white)
                .cornerRadius(90)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
