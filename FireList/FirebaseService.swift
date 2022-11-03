//
//  FirebaseService.swift
//  FireList
//
//  Created by ksd on 01/11/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    private let dbRef = Firestore.firestore()
    private var ref: DocumentReference?
    private let collectionRef: CollectionReference?
    
    init(){
        collectionRef = dbRef.collection("shoppinglist")
    }
    
    func add(item: ShoppingItem) -> String? {
        var id: String?
        do {
            let newDocumentReference = try collectionRef?.addDocument(from: item)
            id = newDocumentReference?.documentID
        }
        catch{
            print(error)
        }
        return id
    }
    
    func delete(item: ShoppingItem) {
        guard let id = item.id,let docRef = collectionRef?.document(id) else {return}
        docRef.delete()
    }
    
    func update(_ item: ShoppingItem) {
        guard let id = item.id,let docRef = collectionRef?.document(id) else {return}
        do {
            try docRef.setData(from: item)
        }
        catch {
            
        }
    }
    
    func getAll() async -> [ShoppingItem] {
        guard let collectionRef = collectionRef else {return []}
        var items = [ShoppingItem]()
        do {
            let snapshot = try await collectionRef.getDocuments()
            items = snapshot.documents.compactMap{ queryDocumentSnapshot in
                return try! queryDocumentSnapshot.data(as: ShoppingItem.self)
            }
        } catch {
            print("UPS!")
        }
        return items
    }
    
    func listenForData(_ completionHandler: @escaping ([ShoppingItem])->()){
        guard let collectionRef = collectionRef else {return}
        collectionRef.addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {return}
            let items = documents.compactMap{ (item) -> ShoppingItem? in
                return try? item.data(as: ShoppingItem.self)
            }
            completionHandler(items)
        }
    }
}
