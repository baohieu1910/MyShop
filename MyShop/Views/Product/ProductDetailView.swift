//
//  ProductDetailView.swift
//  MyShop
//
//  Created by Hieu Le on 3/2/24.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userManager = UserManager.shared
    let product: Product
    
    private var imageSize: CGFloat {
        let width = UIScreen.screenWidth
        let height = UIScreen.screenHeight / 2
        return width > height ? height : width
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    product.image?
                        .resizable()
                        .scaledToFit()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .clipped()
                    
                    if product.checkOutOfStock() {
                        ZStack {
                            Circle()
                                .foregroundColor(.black)
                                .frame(width: imageSize / 4, height: imageSize / 4)
                                .opacity(0.7)
                            
                            Text("Sold")
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(width: imageSize, height: imageSize)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(product.price, specifier: "%.0f")$")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("MyColor"))
                    
                    Text("\(product.name ?? "N/A")")
                        .font(.system(size: 25, weight: .bold))
                        .lineLimit(2)
                    
                    Text("Sold \(product.sold)")
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.system(size: 18, weight: .bold))
                    
                    Text("This product currently has no description. Description will update later.")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Divider()
                
                NavigationLink {
                    if let user = product.user {
                        ShopDetailView(user: user)
                    }
                } label: {
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                            .frame(width: UIScreen.screenWidth / 6, height: UIScreen.screenWidth / 6)
                            .background(Color("MyColor"))
                            .cornerRadius(90)
                        
                        VStack(alignment: .leading) {
                            Text("\(product.user?.username ?? "N/A")")
                                .lineLimit(1)
                            
                            Text((product.user?.productsCount ?? 0) > 1 ? "\(product.user?.productsCount ?? 0) products." : "\(product.user?.productsCount ?? 0) product.")
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                
            }
            .edgesIgnoringSafeArea(.all)
            .background(Color("LightGray"))
            
            VStack {
                Spacer()
                
                if product.user != userManager.currentUser && !product.checkOutOfStock() {
                    HStack(spacing: 0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth / 6)
                                .foregroundColor(Color("MyColor"))
                            
                            if let user = userManager.currentUser {
                                Button {
                                    Utils.addProductToCart(user: user, product: product)
                                    dismiss()
                                } label: {
                                    Text("Add to cart")
                                        .foregroundColor(Color("MyColor"))
                                        .font(.system(size: 20))
                                        .padding()
                                        .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 8)
                                        .background(.white)
                                        .cornerRadius(20)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                }
                            } else {
                                NavigationLink {
                                    LoginView()
                                } label: {
                                    Text("Add to cart")
                                        .foregroundColor(Color("MyColor"))
                                        .font(.system(size: 20))
                                        .padding()
                                        .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 8)
                                        .background(.white)
                                        .cornerRadius(20)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
            }
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .frame(width: UIScreen.screenWidth / 10, height: UIScreen.screenWidth / 10)
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
    
    
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ExampleData.product)
    }
}
