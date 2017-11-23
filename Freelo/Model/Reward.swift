//
//  Reward.swift
//  Freelo
//
//  Created by Hugo on 9/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation

class Reward {
    var idReward: String
    var name: String
    var description: String
    var price: Double
    var quantity: Int
    var pictureID: String
    var status: Bool
    
    init() {
        idReward = ""
        name = ""
        description = ""
        price = 0.0
        quantity = 0
        pictureID = ""
        status = false
    }
    
    init(id: String, rewardName: String, rewardDescription: String, rewardPrice: Double, rewardQuantity: Int, rewardPictureID: String, rewardStatus: Bool) {
        idReward = id
        name = rewardName
        description = rewardDescription
        price = rewardPrice
        quantity = rewardQuantity
        pictureID = rewardPictureID
        status = rewardStatus
    }
    
    init(from dictionary: [String: Any]) {
        idReward = dictionary["idReward"] as! String
        name = dictionary["name"] as! String
        description = dictionary["description"] as! String
        price = dictionary["price"] as! Double
        quantity = dictionary["quantity"] as! Int
        pictureID = dictionary["pictureID"] as! String
        status = dictionary["status"] as! Bool
    }
}
