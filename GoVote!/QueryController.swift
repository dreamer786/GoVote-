//
//  QueryController.swift
//  GoVote!
//
//  Created by Mahataz Khandaker on 11/11/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class QueryController: UIViewController {
    @IBOutlet weak var birthControl : UITextField!;//change to abortion
    @IBOutlet weak var gunControl: UITextField!;
    @IBOutlet weak var muslimBan: UITextField!;
    @IBOutlet weak var environment: UITextField!;
    let birthControlOptions = ["pro-choice", "pro-life"];
    let gunControlOptions = ["pro", "against", "it's complicated"];
    let muslimBanAndEnvironmentOptions = ["pro", "against"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        birthControl.loadDropdownData(data: birthControlOptions)
        gunControl.loadDropdownData(data: gunControlOptions)
        muslimBan.loadDropdownData(data: muslimBanAndEnvironmentOptions);
        environment.loadDropdownData(data: muslimBanAndEnvironmentOptions);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        let destination:QueryResultsTableViewController = segue.destination as! QueryResultsTableViewController
        destination.birthControlChoice = birthControl.text;
        destination.gunControlChoice = gunControl.text;
        destination.muslimBanChoice = muslimBan.text;
        destination.environmentChoice = environment.text;
        
        // Pass the selected object to the new view controller.
    }
    

}
