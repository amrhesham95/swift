//
//  MyViewController.swift
//  Lab2MovieNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData
class MyViewController: UIViewController {
    var name: String?
    var rating: Float?
    var genre: String?
    var release:Int!
    var imgString:String?
    func setLabels(obj:NSManagedObject){
        name=obj.value(forKey: "title") as! String
        rating=obj.value(forKey: "rating") as! Float
        genre=obj.value(forKey: "genre") as! String
        release=obj.value(forKey: "releaseYear") as! Int
        imgString=obj.value(forKey: "imgString") as! String
        
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    override func viewDidLoad() {
        titleLabel.text=name
        ratingLabel.text=String(rating!)
        yearLabel.text = String(release)
        genreLabel.text=genre!.description
        var networkIndicator=UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        networkIndicator.center=self.view.center
        networkIndicator.startAnimating()
        self.view.addSubview(networkIndicator)
        let url=URL(string:imgString!)
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task = session.downloadTask(with: request) { (url, response, error) in
            do{
                
                if(error != nil){
                    
                    print("inside error")
                    DispatchQueue.main.async {
                        networkIndicator.stopAnimating()
                        self.imgView.image = UIImage(named: "holder.png")
                       

                    }
                }else{
                    
                var picData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    networkIndicator.stopAnimating()
                    self.imgView.image = UIImage(data: picData)
                    
                    
                    }
                    
                }
                
                
            }catch{
                
            }
            }
    task.resume()
        
        super.viewDidLoad()
        
        //imgView.image=UIImage(named: imgString!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
