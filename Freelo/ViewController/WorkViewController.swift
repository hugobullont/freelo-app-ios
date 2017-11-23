//
//  WorkViewController.swift
//  Freelo
//
//  Created by Hugo on 23/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {

    var work: Work? {
        didSet {
            if let currentWork = work {
                print("Has a Work: \(currentWork.name)")
                
            }
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pubPriceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateData(fromWork: work!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateData(fromWork work: Work) {
        nameLabel.text = work.name
        pubPriceLabel.text = String(format: "S/. %.02f", work.pubPrice)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
