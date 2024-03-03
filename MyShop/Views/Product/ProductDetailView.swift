//
//  ProductDetailView.swift
//  MyShop
//
//  Created by Hieu Le on 3/2/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var imageSize: CGFloat {
        let width = UIScreen.screenWidth
        let height = UIScreen.screenHeight / 2
        return width > height ? height : width
    }
    
    var body: some View {
        VStack {
            ScrollView {
                product.image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("$\(product.price, specifier: "%.0f")")
                        .font(.system(size: 30))
                    
                    Text("\(product.name ?? "N/A")")
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.screenWidth / 6, height: UIScreen.screenWidth / 6)
                        .background(.orange)
                        .cornerRadius(90)
                    
                    VStack(alignment: .leading) {
                        Text("\(product.user?.username ?? "N/A")")
                            .lineLimit(1)
                        
                        Text((product.user?.productsCount ?? 0) > 1 ? "\(product.user?.productsCount ?? 0) products." : "\(product.user?.productsCount ?? 0) product.")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider()
                
            }
            .ignoresSafeArea()
            
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Image(systemName: "cart")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding()
                        .frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenWidth / 8)
                        .background(.mint)
                }
                
                Button {
                    
                } label: {
                    Text("Buy")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding()
                        .frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenWidth / 8)
                        .background(.orange)
                }
            }
            .padding(.vertical)
            
            
        }
        
    }
    
    
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ExampleData.product)
    }
}
