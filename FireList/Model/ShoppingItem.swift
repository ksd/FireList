//
//  ShoppingItem.swift
//  FireList
//
//  Created by ksd on 01/11/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct ShoppingItem: Codable, Identifiable {
    @DocumentID var id: String? 
    let name: String
    var amount = 1
}
