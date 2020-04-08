//
//  RealmViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {

    private var taskList: Results<Task>?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    private var isEdit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        taskList = TaskService.shared.findAll()
        tableView.reloadData()
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

extension RealmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        
        cell.nameLabel.text = taskList?[indexPath.row].name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        
        if let date = taskList?[indexPath.row].createdAt {
            cell.dateLabel.text = dateFormatter.string(from: date)
        } else {
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.destructive, title: "Delete") { (deleteAction, indexPath) -> Void in
            
            let listToBeDeleted = self.taskList?[indexPath.row]
            
            TaskService.shared.delete(task: listToBeDeleted!)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
        return [deleteAction]
    }
}
