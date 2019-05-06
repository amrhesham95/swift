//
//  MyTableViewController.swift
//  Lab2MovieNetwork
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var movieArray:[Movie]!
    var jsonArray:[Dictionary<String,Any>]?
    override func viewDidLoad() {
        movieArray=[];
        let url=URL(string: "https://api.androidhive.info/json/movies.json")
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task=session.dataTask(with: request) { (data, response, error) in
            do{
                self.jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as!Array<Dictionary<String,Any>>
                for item in self.jsonArray!{
                    var numberYear = item["releaseYear"] as! NSNumber
                    var intYear=numberYear.intValue
                    
                    var numberRating = item["rating"]as!NSNumber
                    var ratingString=numberRating.stringValue
                    var movieObj=Movie(title: item["title"] as! String, image:item["image"] as! String, rating: ratingString, releaseYear:intYear, genre: item["genre"] as! [String])
                    self.movieArray.append(movieObj)
                }
                
            }catch{
                print("error happened!")
            }
            
        }
            task.resume()
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
        
        return (jsonArray?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var dict=Dictionary<String, Any>();
        dict=jsonArray![indexPath.row]
        cell.textLabel?.text=dict["title"] as! String
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
            secondVC.setLabels(obj:movieArray![(self.tableView.indexPathForSelectedRow?.row)!])
            
            
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

    }
    
}
