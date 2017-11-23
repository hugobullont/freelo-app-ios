//
//  CategoryRepository.swift
//  Freelo
//
//  Created by Hugo on 23/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation
import FirebaseDatabase

class CategoryRepository {
    var listOfCategories: [Category] = []
    
    func updateListOfCategories() {
        let ref = Database.database().reference().child("categories")
        ref.observe(DataEventType.value, with: { snapshot in
            print(snapshot.childrenCount)
            print("Ya Jalaste. Todo te va mal en la vida. Ella no te hace caso. Suicídate.")
            let enumerator = snapshot.children
            self.listOfCategories = []
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let restDict = rest.value as? [String: Any]
                let category = Category.init(from: restDict!)
                self.listOfCategories.append(category)
                
            }
        })
    }
    
    func getCategoryIdByName(name: String) -> String{
        for category in listOfCategories {
            if(category.name == name) {
                return category.idCategory
            }
        }
        return "nil"
    }
}
