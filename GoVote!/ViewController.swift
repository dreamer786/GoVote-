//
//  ViewController.swift
//  GoVote!
//
//  Created by Mahataz Khandaker on 11/11/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    let message = "Hello Git!";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(message)
        print("Another one")
        
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("0").observeSingleEvent(of: DataEventType.value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["firstName"] as? String ?? ""
            
            print(username)
        }
        print("Database test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

