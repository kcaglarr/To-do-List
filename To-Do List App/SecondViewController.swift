//
//  SecondViewController.swift
//  To-Do List App
//
//  Created by Kerim Çağlar on 16/01/2017.
//  Copyright © 2017 Kerim Çağlar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textFieldArea: UITextField!
    
    @IBAction func save(_ sender: Any) {
        
        let taskObj = UserDefaults.standard.object(forKey: "tasks")
        
        var tasks:[String]
        
        if let tasksArr = taskObj as? [String]
        {
            tasks = tasksArr
            tasks.append(textFieldArea.text!)
            
            print(tasks)
        }
        
        else
        {
             tasks = [textFieldArea.text!]
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        
        textFieldArea.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

