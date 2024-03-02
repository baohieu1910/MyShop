//
//  AddProductView.swift
//  MyShop
//
//  Created by Hieu Le on 3/2/24.
//

import SwiftUI

struct AddProductView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var productListViewModel: ProductListViewModel
    let user: User
    
    @State var name = ""
    @State var price = 0.0
    var body: some View {
        VStack {
            HStack {
                Text("Product name")
                
                TextField("Product name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                Text("Price")
                
                TextField("Price", value: $price, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            Button {
                productListViewModel.addProduct(user: user, name: name, detail: "", imageName: "Samba", price: price)
                dismiss()
            } label: {
                Text("Add product")
                    .padding()
                    .frame(width: UIScreen.screenWidth / 3)
                    .background(.orange)
                    .cornerRadius(90)
            }
        }
        .padding(.horizontal)
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(productListViewModel: ProductListViewModel(), user: ExampleData.user)
    }
}
