//
//  CoreDataViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    private var isEdit: Bool = false

    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var taskList: [NSManagedObject] = []
    
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate!.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        request.returnsObjectsAsFaults = false
        
        do {
            taskList = try context!.fetch(request) as! [NSManagedObject]
            tableView.reloadData()

        } catch {
            print("Failed")
        }
    }
    
    
    @IBAction func editClick(_ sender: Any) {
        isEdit = !isEdit
        tableView.setEditing(isEdit, animated: true)
        
        switch isEdit {
        case true:
            editButton.title = "Готово"
        default:
            editButton.title = "Редактировать"
        }
    }
}


extension CoreDataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        cell.nameLabel.text = taskList[indexPath.row].value(forKey: "name") as? String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        if let date = taskList[indexPath.row].value(forKey: "date") as? Date {
            cell.dateLabel.text = dateFormatter.string(from: date)
        } else {
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.destructive, title: "Delete") { (deleteAction, indexPath) -> Void in
            
            let task = self.taskList[indexPath.row]
            self.context?.delete(task)
            try! self.context?.save()
            self.taskList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        return [deleteAction]
    }
}
