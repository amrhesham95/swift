//
//  ViewController.swift
//  Lab2Salary
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mytextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func employeeBtn(_ sender: UIButton) {
        var sal=Int(mytextField.text!)
        let employee = Employee(salary:sal!)
        myLabel.text = employee.getSalary().description
        
    }
    @IBAction func managerBtn(_ sender: UIButton) {
        var sal=Int(mytextField.text!)
        let manager = Manager(salary:sal!)
        myLabel.text = manager.getSalary().description
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

