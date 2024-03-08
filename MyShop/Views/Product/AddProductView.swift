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
    @State private var quantity = 0
    @State private var price = 0.0
    @State private var showError = false
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    private var imageSize: CGFloat {
        let width = UIScreen.screenWidth
        let height = UIScreen.screenHeight / 2
        return width > height ? height : width
    }
    
    var body: some View {
        VStack {
            if image == nil {
                Text("")
                    .padding()
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFit()
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                        } else {
                            VStack {
                                Image(systemName: "photo")
                                    .font(.system(size: UIScreen.screenWidth / 4))
                                
                                Text("Input an image of your product.")
                            }
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
                    
                    HStack {
                        Text("Quantity")
                            .padding(.trailing, 10)
                        
                        TextField("Quantity", value: $quantity, format: .number)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 0.3)
                            )
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
                
                Button {
                    if checkAddProduct() && checkImage() {
                        let imageData = inputImage?.pngData()
                        productListViewModel.addProduct(user: user, name: name, detail: "", imageData: imageData!, quantity: quantity, price: price)
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
                        .background(Color("MyColor"))
                        .cornerRadius(90)
                }
                .alert("Please enter product name, price, quantity and image.", isPresented: $showError) {
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("OK")
                    }
                }
            }
            .ignoresSafeArea()
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func checkAddProduct() -> Bool {
        return name.count != 0 && price > 0 && quantity > 0
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
