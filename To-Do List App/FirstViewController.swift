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
    
}

