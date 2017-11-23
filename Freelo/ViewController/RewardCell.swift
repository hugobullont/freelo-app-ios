//
//  RewardCell.swift
//  Freelo
//
//  Created by Hugo on 23/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseStorageUI

class RewardCell: UICollectionViewCell {
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    func updateValues(fromReward reward: Reward) {
        nameLabel.text = reward.name
        priceLabel.text = String(format: "S/. %.02f", reward.price)
        let pathReference = Storage.storage().reference(withPath: reward.pictureID)
        imageImageView.sd_setImage(with: pathReference)
    }
}
