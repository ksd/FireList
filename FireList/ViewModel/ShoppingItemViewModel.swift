//
//  ShoppingItemViewModel.swift
//  FireList
//
//  Created by ksd on 01/11/2022.
//

import Foundation

class ShoppingItemViewModel: ObservableObject {
    @Published var shoppingItems = [ShoppingItem]()
    
    private var dbService = FirebaseService()
    
    init() {
        self.listenForData()
    }
    
    func addshoppingItem(name: String, amount: Float) {
        let shoppingItem = ShoppingItem(name: name, amount: Int(amount))
        let newId = dbService.add(item: shoppingItem)
        print(String(describing: newId))
    }
    
    func getAll(){
        Task {
            shoppingItems = await dbService.getAll()
        }
    }
    
    func listenForData(){
        dbService.listenForData { items in
            self.shoppingItems = items
        }
    }
}
