//
//  Work.swift
//  Freelo
//
//  Created by Hugo on 9/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Work {
    var idWork: String
    var name: String
    var description: String
    var basePrice: Double
    var pubPrice: Double
    var date: String
    var createdBy: String
    var workedBy: String
    var idCategory: String
    var status: String
    
    init() {
        idWork = ""
        name = ""
        description = ""
        basePrice = 0.0
        pubPrice = 0.0
        date = ""
        createdBy = ""
        workedBy = ""
        idCategory = ""
        status = ""
    }
    
    init(id: String, workName: String, workDescription: String, workBasePrice: Double, workPubPrice: Double, workDate: String, workCreatedBy: String, workWorkedBy: String, workIdCategory: String, workStatus: String) {
        idWork = id
        name = workName
        description = workDescription
        basePrice = workBasePrice
        pubPrice = workPubPrice
        date = workDate
        createdBy = workCreatedBy
        workedBy = workWorkedBy
        idCategory = workIdCategory
        status = workStatus
    }
    
    init(from dictionary: [String: Any]) {
        idWork = dictionary["idWork"] as! String
        name = dictionary["name"] as! String
        description = dictionary["description"] as! String
        basePrice = dictionary["basePrice"] as! Double
        pubPrice = dictionary["pubPrice"] as! Double
        date = dictionary["date"] as! String
        createdBy = dictionary["createdBy"] as! String
        workedBy = dictionary["workedBy"] as! String
        idCategory = dictionary["idCategory"] as! String
        status = dictionary["status"] as! String
    }
    
}
