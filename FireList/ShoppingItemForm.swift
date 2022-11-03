//
//  ShoppingItemForm.swift
//  FireList
//
//  Created by ksd on 03/11/2022.
//

import SwiftUI

struct ShoppingItemForm: View {
    var viewModel: ShoppingItemViewModel
    
    @State private var name = ""
    @State private var amount: Float = 0
    var body: some View {
        VStack{
            Form {
                TextField("Navn", text: $name)
                HStack{
                    Slider(value: $amount, in: 1...10)
                    Spacer(minLength: 50)
                    Text("\(Int(amount))")
                }
                Button {
                    viewModel.addshoppingItem(name: name, amount: amount)
                } label: {
                    Label("Tilføj", systemImage: "pencil")
                }

            }
            
        }.padding()
    }
}

struct ShoppingItemForm_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemForm(viewModel: ShoppingItemViewModel())
    }
}
