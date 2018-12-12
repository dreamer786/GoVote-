//
//  MapResultsViewController.swift
//  GoVote!
//
//  Created by Kelly Ng on 12/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//  modified version of QueryResultsTableViewController
//

import UIKit
import Firebase 

class MapResultsViewController: UITableViewController{
    
    var state: String? = ""
    var myData: DatabaseReference!
    var results = [Dictionary<String, String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myData = Database.database().reference()
        retrieveSenators()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func retrieveSenators(){
        let _ = myData.observe(.childAdded, with: { snapshot in
            let dict = snapshot.value as![String: String]
            let myState: String? = dict["state"]
            //self.state = "NY"
            if self.state == myState {
                self.results.append(dict )
            /*if self.state == "New York" {
                self.state = "NY"
                if myState == self.state{
                self.results.append(dict)
            }*/
            }
            self.tableView.reloadData()
        }) {(error) in
            print("Failed to get snapshot", error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let res:[String:String] = results[indexPath.row]
        cell.textLabel?.text = "\(res["firstName"]!) \(res["lastName"]!)"
        // Configure the cell...
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: ProfileViewController = storyboard?.instantiateViewController(withIdentifier: "candidateView") as! ProfileViewController
        vc.candidateInfo = results[indexPath.row]
        show(vc, sender: nil)
    }
    
}
