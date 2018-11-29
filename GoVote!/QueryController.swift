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
    @IBOutlet weak var weedLegalization: UITextField!
    let birthControlOptions = ["Pro-choice", "Pro-life"];
    let gunControlOptions = ["Support", "Against", "Mixed"];
    let muslimBanAndEnvironmentOptions = ["Support", "Against", "Mixed"];
    let weedLegalizationOptions = ["Medical only", "Recreational and medical", "Against"]

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("dismissPicker")))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        self.view.addSubview(view)*/
        self.hideKeyboard()
        // Do any additional setup after loading the view.
        birthControl.loadDropdownData(data: birthControlOptions)
        gunControl.loadDropdownData(data: gunControlOptions)
        muslimBan.loadDropdownData(data: muslimBanAndEnvironmentOptions);
        environment.loadDropdownData(data: muslimBanAndEnvironmentOptions);
        weedLegalization.loadDropdownData(data: weedLegalizationOptions)
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
        
        // Pass the selected object to the new view controller.
        destination.birthControlChoice = birthControl.text;
        destination.gunControlChoice = gunControl.text;
        destination.muslimBanChoice = muslimBan.text;
        destination.environmentChoice = environment.text;
        destination.weedLegalizationChoice = weedLegalization.text;
        
        
    }
    

}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
