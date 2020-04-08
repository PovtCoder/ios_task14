//
//  AddTask2ViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit
import CoreData

class AddTask2ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func saveClick(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity =  NSEntityDescription.entity(forEntityName: "Task", in: context)
        
        let task = NSManagedObject(entity: entity!, insertInto:context)
        
        task.setValue(nameTextField.text ?? "", forKey: "name")
        task.setValue(Date(), forKey: "date")
        
        
        do {
           try context.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        navigationController?.popViewController(animated: true)
    }
}

