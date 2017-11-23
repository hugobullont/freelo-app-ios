//
//  NewFreeloViewController.swift
//  Freelo
//
//  Created by Hugo on 23/11/17.
//  Copyright © 2017 sadboyz. All rights reserved.
//

import UIKit

class NewFreeloViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerDataSource = ["White", "Red", "Green", "Blue"]
    var stringCategoryId = "null"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return catRepo.listOfCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRepo.listOfCategories[row].name
    }
    
    
    var categories: [Category] = []
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var categoriesPickerView: UIPickerView!
    @IBOutlet weak var createFreeloButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.navigationController?.navigationBar.prefersLargeTitles = false
        catRepo.updateListOfCategories()
        self.title = "New Freelo"
        categories = catRepo.listOfCategories
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // do stuff 2 seconds later
            self.categoriesPickerView.dataSource = self
            self.categoriesPickerView.delegate = self
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        stringCategoryId = catRepo.listOfCategories[row].idCategory
    }
    
    @IBAction func createWorkEvent(_ sender: UIButton) {
        if (nameTextField.text != "" && descriptionTextField.text != "" && priceTextField.text != ""){
            workRepo.addWorkToDatabase(workName: nameTextField.text!, workDescription: descriptionTextField.text!, workBasePrice: Double(priceTextField.text!)!, workIdCategory: stringCategoryId)
            
            nameTextField.text = ""
            descriptionTextField.text = ""
            priceTextField.text = ""
            
            let dialog = UIAlertController(title: "Freelo Creado",
                                           message: "El Freelo ha sido creado.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
        else {
            let dialog = UIAlertController(title: "Freelo No Creado",
                                           message: "Rellena los campos.",
                                           preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            dialog.addAction(defaultAction)
            // Present the dialog.
            // ... Do not worry about animated or completion for now.
            present(dialog,animated: true,completion: nil)
        }
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
