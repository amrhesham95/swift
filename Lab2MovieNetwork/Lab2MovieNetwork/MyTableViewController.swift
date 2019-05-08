//
//  MyTableViewController.swift
//  Lab2MovieNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData
import NetworkExtension
class MyTableViewController: UITableViewController {
    //var movieMangedObjects=[NSManagedObject]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
//        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "MovieDB")
//        do{
//            movieArray=try managerContext.fetch(fetchRequest)
//            
//        }catch{
//            print("error while fetching")
//        }
        
    }
    var movieArray=[NSManagedObject]()
    var jsonArray:[Dictionary<String,Any>]?
    override func viewDidLoad() {
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        jsonArray=[Dictionary<String,Any>]()
        
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "MovieDB")
        do{
            movieArray=try managerContext.fetch(fetchRequest)
            
        }catch{
            print("error while fetching")
        }
        
        let url=URL(string: "https://api.androidhive.info/json/movies.json")
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task=session.dataTask(with: request) { (data, response, error) in
            do{
                let entity=NSEntityDescription.entity(forEntityName: "MovieDB", in: managerContext)
                self.jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as!Array<Dictionary<String,Any>>
                
                for item in self.jsonArray!{
                    let movie=NSManagedObject(entity: entity!, insertInto: managerContext)
                    var numberYear = item["releaseYear"] as! NSNumber
                    var intYear=numberYear.intValue
                    
                    var numberRating = item["rating"]as!NSNumber
                    var ratingString=numberRating.stringValue
                    var movieObj=Movie(title: item["title"] as! String, image:item["image"] as! String, rating: Float(item["rating"] as! NSNumber), releaseYear:intYear, genre: item["genre"] as! [String])
                    movie.setValue(movieObj.title, forKey: "title")
                    movie.setValue(movieObj.genre.description, forKey: "genre")
                    movie.setValue(movieObj.rating, forKey: "rating")
                    movie.setValue(movieObj.releaseYear, forKey: "releaseYear")
                    movie.setValue(movieObj.image, forKey: "imgString")
                    do{
                        try managerContext.save()
                        self.movieArray.append(movie)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }catch{
                            print("error while adding to DB!")
                    }
                    
                }
                
            }catch{
                print("error happened!")
            }
            
        }
        if(movieArray.count==0){
            task.resume()
            print("downloading....")
        }
          super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return (movieArray.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movieArray[indexPath.row].value(forKey: "title") as! String
//        var dict=Dictionary<String, Any>();
//        dict=jsonArray![indexPath.row]
//        dict["title"] as! String
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.destination.restorationIdentifier=="myViewController"){
            let secondVC=segue.destination as! MyViewController
            secondVC.setLabels(obj:movieArray[(self.tableView.indexPathForSelectedRow?.row)!])
            
            
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

    }
    
}
