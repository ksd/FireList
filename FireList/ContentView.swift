//
//  ContentView.swift
//  FireList
//
//  Created by ksd on 01/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ShoppingItemViewModel()
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationView {
            List(viewModel.shoppingItems){item in
                HStack{
                    Text(item.name).font(.title2)
                    Spacer()
                    Text("\(item.amount)").font(.headline)
                }
            }
            .navigationTitle(Text("Indkøbsliste"))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Tilføj") {
                        showAddSheet = true
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                ShoppingItemForm(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
