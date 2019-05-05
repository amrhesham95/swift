//
//  Person.swift
//  Lab2Salary
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import Foundation
class Person{
    var salary:Int
    func getSalary() -> Int{
        return salary
    }
    init(salary:Int){
        self.salary=salary
    }
}
