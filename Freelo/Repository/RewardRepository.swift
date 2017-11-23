//
//  RewardRepository.swift
//  Freelo
//
//  Created by Hugo on 22/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation
import FirebaseDatabase

class RewardRepository {
    var listOfRewards: [Reward] = []
    
    func updateListOfRewards() {
        let ref = Database.database().reference().child("rewards")
        ref.observe(DataEventType.value, with: { snapshot in
            print(snapshot.childrenCount)
            let enumerator = snapshot.children
            self.listOfRewards = []
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let restDict = rest.value as? [String: Any]
                let reward = Reward.init(from: restDict!)
                if(reward.status && reward.quantity > 0){
                    self.listOfRewards.append(reward)
                }
                
            }
        })
    }
}
