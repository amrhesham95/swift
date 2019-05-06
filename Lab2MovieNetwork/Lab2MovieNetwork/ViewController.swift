//
//  ViewController.swift
//  Lab2MovieNetwork
//
//  Created by Esraa Hassan on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url=URL(string: "https://api.androidhive.info/json/movies.json")
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task=session.dataTask(with: request) { (data, response, error) in
            do{
                var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as!Array<Dictionary<String,Any>>
            
                print(String(output.count))
                
            }catch{
                print("error happened!")
            }
            }.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

