//
//  FireListApp.swift
//  FireList
//
//  Created by ksd on 01/11/2022.
//

import SwiftUI
import FirebaseCore

@main
struct FireListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
