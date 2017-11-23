//
//  WorkRepository.swift
//  Freelo
//
//  Created by Hugo on 11/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import Foundation
import FirebaseDatabase

class WorkRepository {
    
     var listOfWorks: [Work] = []
     var publishedWorks: [Work] = []
    
    func addWorkToDatabase(workName: String, workDescription: String, workBasePrice: Double, workIdCategory: String) {
        let pubPrice: Double = workBasePrice * 0.85
        let key = Database.database().reference().child("works").childByAutoId().key
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy H:mm"
        let dateString = formatter.string(from: date)
        
        let work = Work.init(id: key, workName: workName, workDescription: workDescription, workBasePrice: workBasePrice, workPubPrice: pubPrice, workDate: dateString, workCreatedBy: SessionVariables.currentUserId, workWorkedBy: "noBody", workIdCategory: workIdCategory, workStatus: "open")
        Database.database().reference().child("works").child(key).setValue(work.toDictionary())
    }
    
    func updateListOfWorks() {
        
        let ref = Database.database().reference().child("works")
        print("Before")
        ref.observe(DataEventType.value, with: { snapshot in
            print(snapshot.childrenCount)
            print("During")
            let enumerator = snapshot.children
            self.listOfWorks = []
            self.publishedWorks = []
            while let rest = enumerator.nextObject() as? DataSnapshot {
                let restDict = rest.value as? [String: Any]
                let work = Work.init(from: restDict!)
                if (work.status == "open" && !(work.createdBy == SessionVariables.currentUserId)) {
                    self.listOfWorks.append(work)
                }
                if (work.createdBy == SessionVariables.currentUserId) {
                    self.publishedWorks.append(work)
                }
                
            }
        })
        print("Outside")
    }
    
    func getWorkById (workId: String) -> Work? {
        for work in self.listOfWorks {
            if work.idWork == workId {
                return work
            }
        }
        
        for work in self.publishedWorks {
            if work.idWork == workId {
                return work
            }
        }
        return nil
    }
    
    
}
