//
//  MyViewController.swift
//  Lab2MovieNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    var movieTitle: String?
    var rating: String?
    var genre: [String]?
    var release:Int!
    var imgString:String?
    func setLabels(obj:Movie){
        movieTitle=obj.title
        rating=obj.rating
        genre=obj.genre
        release=obj.releaseYear
        imgString=obj.image
        
    }
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    override func viewDidLoad() {
        titleLabel.text=movieTitle
        ratingLabel.text=rating
        yearLabel.text = String(release)
        genreLabel.text=genre!.description
        
        let url=URL(string:imgString!)
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task = session.downloadTask(with: request) { (url, response, error) in
            do{
                var picData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    
                    self.imgView.image = UIImage(data: picData)
                    
                    
                }
                
                
            }catch{
                
            }
            }.resume()
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
