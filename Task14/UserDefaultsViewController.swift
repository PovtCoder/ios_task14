//
//  UserDefaultsViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firstNameTextField.text = Persistance.shared.firstName
        secondNameTextField.text = Persistance.shared.secondName
    }
    
    
    @IBAction func saveClick(_ sender: Any) {
        Persistance.shared.firstName = firstNameTextField.text
        Persistance.shared.secondName = secondNameTextField.text
        
        dismiss(animated: true, completion: nil)
    }
}
