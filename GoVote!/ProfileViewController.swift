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
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var senatorImg: UIImageView!
    @IBOutlet weak var abortion: UILabel!
    @IBOutlet weak var gunControl: UILabel!
    @IBOutlet weak var link: UITextView!
    @IBOutlet weak var muslimBan: UILabel!
    @IBOutlet weak var weedLegalization: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(candidateInfo!["firstName"]!)
        // Do any additional setup after loading the view.
        name.text = candidateInfo!["firstName"]! + " " + candidateInfo!["lastName"]!
        if (candidateInfo!["party"]! != "R"){
            party.text = "Party: Democrat"
        }
        else {
            party.text = "Party: Republican"
        }
        var myImage = UIImage(named: "\(candidateInfo!["lastName"]!).jpg")
        myImage = myImage?.resize(targetSize: senatorImg.frame.size)
        senatorImg.image = myImage
        link.isEditable = false
        link.dataDetectorTypes = .link
        link.text = candidateInfo!["link"]
        link.font = UIFont(name: (link.font?.fontName)!, size: 18)
        abortion.text = "Abortion: \(candidateInfo!["abortion"]!)"
        gunControl.text = "Gun Control: \(candidateInfo!["gunControl"]!)"
        muslimBan.text = "Muslim Ban: \(candidateInfo!["muslimBan"]!)"
        weedLegalization.text = "Weed Legalization: \(candidateInfo!["weedLegalization"]!)"
        state.text = "State: \(candidateInfo!["state"]!)"
        
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
