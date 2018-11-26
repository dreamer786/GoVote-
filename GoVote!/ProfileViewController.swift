//
//  ProfileViewController.swift
//  GoVote!
//
//  Created by Kelly Ng on 11/14/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var candidateInfo : [String:String]?

    @IBOutlet weak var party: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var senatorImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(candidateInfo!["firstName"]!)
        // Do any additional setup after loading the view.
        name.text = candidateInfo!["firstName"]! + " " + candidateInfo!["lastName"]!
        if (candidateInfo!["party"]! != "R"){
            party.text = "Democrat"
        }
        else {
            party.text = "Republican"
        }
        let myImage = UIImage(named: "\(candidateInfo!["lastName"]!).jpg")
        senatorImg.image = myImage
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
