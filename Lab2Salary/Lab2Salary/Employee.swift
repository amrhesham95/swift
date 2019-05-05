//
//  Employee.swift
//  Lab2Salary
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import Foundation
class Employee : Person{
    override func getSalary() -> Int {
        return salary * 3
    }
}
