//
//  AddTaskViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!

    
    @IBAction func saveClick(_ sender: Any) {
        let task = Task()
        task.name = nameLabel.text ?? ""
        
        TaskService.shared.save(task: task)
        
        navigationController?.popViewController(animated: true)
    }
}
