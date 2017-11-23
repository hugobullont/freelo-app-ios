//
//  Category.swift
//  Freelo
//
//  Created by Hugo on 23/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation

class Category {
    var idCategory: String
    var name: String
    
    init() {
        idCategory = ""
        name = ""
    }
    
    init(id: String, categoryName: String) {
        idCategory = id
        name = categoryName
    }
    
    init(from dictionary: [String: Any]) {
        idCategory = dictionary["idCategory"] as! String
        name = dictionary["name"] as! String
    }
    
}
