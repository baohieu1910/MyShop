//
//  Order.swift
//  MyShop
//
//  Created by Hieu Le on 2/28/24.
//

import Foundation
import SwiftUI

struct Order: Hashable, Identifiable {
    var id = UUID()
    var name: String?
    var imageName: String?
    var price: Double?
    
}
