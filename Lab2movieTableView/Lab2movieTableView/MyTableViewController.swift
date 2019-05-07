//
//  MyTableViewController.swift
//  Lab2movieTableView
//
//  Created by JETS Mobile Lab - 5 on 5/5/19.
//  Copyright © 2019 ios. All rights reserved.
//

import UIKit
import CoreData
class MyTableViewController: UITableViewController,addingProtocol {
    var movieArrayManagedObjects=Array<NSManagedObject>()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate=UIApplication.shared.delegate as!AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do{
            movieArrayManagedObjects=try managerContext.fetch(fetchRequest)
            self.tableView.reloadData()
            
            
        }catch{
            print("error while fetching!")
        }
    }
    func addMovie(movie: MovieClass) {
        movieArray?.append(movie)
        let appDelegate=UIApplication.shared.delegate as!AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managerContext)
        let movieManagedObj=NSManagedObject(entity: entity!, insertInto: managerContext)
        movieManagedObj.setValue(movie.title, forKey: "title")
        movieManagedObj.setValue(movie.releaseYear, forKey: "releaseYear")
        movieManagedObj.setValue(movie.rating, forKey: "rating")
        movieManagedObj.setValue(movie.genre.description, forKey: "genre")
        movieManagedObj.setValue(movie.image, forKey: "imgString")
        do{
            try managerContext.save()
            self.tableView.reloadData()
        }catch{
            print("error!!")
        }
        self.tableView.reloadData()
    }
    

    @IBAction func addBarBtn(_ sender: UIBarButtonItem) {
    }
    
    var movieArray:[MovieClass]?
    override func viewDidLoad() {
        super.viewDidLoad()
         movieArray=[MovieClass(title:"Dawn of the Planet of the Apes",image:"1.jpg",rating:"8.3",releaseYear:2014,genre:["Action", "Drama", "Sci-Fi"]),
                     MovieClass(title:"District 9",image:"2.jpg",rating:"8",releaseYear:2009,genre:["Action", "Sci-Fi", "Thriller"]),
                     MovieClass(title:"X-Men: Days of Future Past",image:"3.jpg",rating:"amazing",releaseYear:2010,genre:["action,comedy"]),
                     MovieClass(title:"fourth movie",image:"4.jpg",rating:"bad",releaseYear:2016,genre:["drama,horror"]),
                     MovieClass(title:"fifth movie",image:"5.jpg",rating:"very good",releaseYear:2005,genre:["horror,action"])]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (movieArrayManagedObjects.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = movieArrayManagedObjects[indexPath.row].value(forKey: "title") as! String

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.destination.restorationIdentifier=="detailsView"){
        let secondVC=segue.destination as! DetailsViewController
            secondVC.setLabels(obj:movieArrayManagedObjects[(self.tableView.indexPathForSelectedRow?.row)!])
            
        }else{
            let secondVC=segue.destination as! AddingViewController
            secondVC.sentProtocol=self
            
        }
        
        
    }
    

}
