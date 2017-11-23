//
//  SearchCell.swift
//  Freelo
//
//  Created by Hugo on 22/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func updateValues(fromWork work: Work) {
        nameLabel.text = work.name
        priceLabel.text = String(format: "S/. %.02f", work.pubPrice)
    }
}
