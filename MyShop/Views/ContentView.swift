//
//  ContentView.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import SwiftUI

class TabBarManager: ObservableObject {
    @Published var isTabBarHidden: Bool {
        didSet {
            print(isTabBarHidden)
        }
    }
    
    init(isHidden: Bool) {
        self.isTabBarHidden = isHidden
    }
}

struct ContentView: View {
    @ObservedObject var tabBarManager = TabBarManager(isHidden: false)
    
    enum ViewStatus {
        case home
        case cart
        case user
    }
    @State var status = ViewStatus.home
    
    var body: some View {
        ZStack {
            NavigationView {
                switch status {
                case .home:
                    HomeView()
                case .cart:
                    CartView()
                case .user:
                    UserView()
                }
            }
            .onAppear {
                tabBarManager.isTabBarHidden = false
                print(UIScreen.screenWidth)
            }
            
            if !tabBarManager.isTabBarHidden {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
