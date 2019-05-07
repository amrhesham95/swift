//
//  DetailsViewController.swift
//  Lab2movieTableView
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import CoreData
class DetailsViewController: UIViewController {
    var name: String?
    var rating: String?
    var genre: String?
    var release:Int!
    var imgString:String?
    func setLabels(obj:NSManagedObject){
        name=obj.value(forKey: "title") as! String
        rating=obj.value(forKey: "rating") as! String
        genre=obj.value(forKey: "genre") as! String
        release=obj.value(forKey: "releaseYear") as! Int
        imgString=obj.value(forKey: "imgString") as! String
        
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text=name
        ratingLabel.text=rating
        releaseYearLabel.text = String(release)
        genreLabel.text=genre!.description
        imgView.image=UIImage(named: imgString!)
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
