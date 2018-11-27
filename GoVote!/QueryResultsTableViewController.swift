//
//  QueryResultsTableViewController.swift
//  GoVote!
//
//  Created by Mahataz Khandaker on 11/12/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase
class QueryResultsTableViewController: UITableViewController{
    var birthControlChoice: String? = nil;
    var gunControlChoice: String? = nil;
    var muslimBanChoice: String? = nil;
    var environmentChoice: String? = nil;
    var ref: DatabaseReference! //save data in list
    var results = [Dictionary<String, String>]()//will contain all the results from reading the database
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        retrieveSenators()
        
        /*
        print ("birthControlChoice: ", birthControlChoice!)
        print ("gunControlChoice: ", gunControlChoice!)
        print ("muslimBanChoice: ", muslimBanChoice!)
        print ("environmentChoice: ", environmentChoice!)
         */
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        /*
        let query = ref.queryOrdered(byChild: "abortion").queryEqual(toValue: birthControlChoice)
        query.observeSingleEvent(of: .childAdded, with: {(snapshot) in
            guard snapshot.value is NSNull else {
                let senator = snapshot.value as! [String: Any]
                print ("\(senator) exists, length is \(senator.count)")
                return
            }
            print("no data available")
        }) {(error) in
        print ("Failed to get snapshot", error.localizedDescription)
            
        }
         */
        
        
    
    }
    func retrieveSenators(){
        let _ = ref.observe(.childAdded, with: { snapshot in
            //print("Hi")
            let dict = snapshot.value as![String: String]
            let bc: String? = dict["abortion"]
            let gc: String? = dict["gunControl"]
            let mb: String? = dict["muslimBan"]
            let ec: String? = dict["helpEnvironment"]
            //print(gc)
            if bc == self.birthControlChoice && gc == self.gunControlChoice
                && mb == self.muslimBanChoice && ec == self.environmentChoice{
                //print ("found senator \(dict["firstName"]!) \(dict["lastName"]!)")
                self.results.append(dict)
            }
            self.tableView.reloadData()
        }) {(error) in
            print("Failed to get snapshot", error.localizedDescription)
        }
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
        return self.results.count
        
    }

    //loads the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let res:[String:String] = results[indexPath.row]
        cell.textLabel?.text = "\(res["firstName"]!) \(res["lastName"]!) \(res["state"]!)"
        // Configure the cell...
        return cell
    }
    
    //goes to profile view upon user selecting a senator
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //perform
        let vc: ProfileViewController = storyboard?.instantiateViewController(withIdentifier: "candidateView") as! ProfileViewController
        vc.candidateInfo = results[indexPath.row]
        show(vc, sender: nil)
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
