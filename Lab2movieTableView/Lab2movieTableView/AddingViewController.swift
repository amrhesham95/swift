//
//  AddingViewController.swift
//  Lab2movieTableView
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit

class AddingViewController: UIViewController {
    var sentProtocol:addingProtocol!
    var name: String?
    var rating: String?
    var genre: String?
    var release:Int!
    var imgString:String?
    @IBAction func addBtn(_ sender: UIButton) {
        name=titleTF.text
        rating=ratingTF.text
        imgString=imageTF.text
        release=Int(yearTF.text!)
        genre=genreTF.text
        var genreArray:[String]
        genreArray.append(genre!)
        let newMovie=Movie(title: name!, image: imgString!, rating: rating!, releaseYear: release, genre: genreArray)
    }
    @IBOutlet weak var imageTF: UITextField!
    @IBOutlet weak var genreTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
