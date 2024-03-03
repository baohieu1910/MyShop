//
//  AddProductView.swift
//  MyShop
//
//  Created by Hieu Le on 3/2/24.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var productListViewModel: ProductListViewModel
    @ObservedObject var userListViewModel = UserListViewModel()
    let user: User
    @State private var name = ""
    @State private var detail = ""
    @State private var price = 0.0
    @State private var showError = false
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(systemName: "photo")
                            .font(.system(size: UIScreen.screenWidth / 4))
                            .foregroundColor(.gray)
                    }
                }
            }
            .onTapGesture {
                showingImagePicker = true
                
            }
            
            VStack {
                VStack(alignment: .leading) {
                    TextField("Enter your product name", text: $name)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                }
                
                VStack(alignment: .leading) {
                    TextField("Enter description of your product", text: $detail)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                }
                
                HStack {
                    Text("Price")
                        .padding(.trailing, 10)
                    
                    TextField("Price", value: $price, format: .number)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.3)
                        )
                        .keyboardType(.decimalPad)
                }
            }
            .padding(.vertical)

            Button {
                if checkProductName() && checkPrice() && checkImage() {
                    let imageData = inputImage?.pngData()
                    productListViewModel.addProduct(user: user, name: name, detail: "", imageData: imageData!, price: price)
                    userListViewModel.updateProducts(user: user)
                    dismiss()
                } else {
                    showError.toggle()
                }
            } label: {
                Text("Add product")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.screenWidth / 3)
                    .background(.orange)
                    .cornerRadius(90)
            }
            .alert("Please enter product name, price and image.", isPresented: $showError) {
                Button(role: .cancel) {
                    
                } label: {
                    Text("OK")
                }
            }
        }
        .padding(.horizontal)
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func checkProductName() -> Bool {
        return name.count != 0
    }
    
    func checkPrice() -> Bool {
        return price > 0
    }
    
    func checkImage() -> Bool {
        guard inputImage != nil else {
            return false
        }
        return true
    }
    
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(productListViewModel: ProductListViewModel(), user: ExampleData.user)
    }
}
