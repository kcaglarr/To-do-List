//
//  FirstViewController.swift
//  To-Do List App
//
//  Created by Kerim Çağlar on 16/01/2017.
//  Copyright © 2017 Kerim Çağlar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks:[String] = []

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let taskObj = UserDefaults.standard.object(forKey: "tasks")
        
        
        if let tasksArr = taskObj as? [String]
        {
            tasks = tasksArr
        }
        
        tblView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        

        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            //Alertview kullanılmalı
            // create the alert
            let alert = UIAlertController(title: "Dikkat", message: "Bunu silmek istediğinizden emin misiniz?", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Evet", style: UIAlertActionStyle.default, handler: {action in
                self.tasks.remove(at: indexPath.row)
                self.tblView.reloadData()
                UserDefaults.standard.set(self.tasks, forKey: "tasks")

            }))
            
            alert.addAction(UIAlertAction(title: "Hayır", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            

        }
    }
    
}

