//
//  VoterViewController.swift
//  GoVote!
//
//  Created by Mahataz Khandaker on 11/29/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class VoterViewController: UIViewController {
    var str: String? = nil
    //@IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadHTMLString(str!, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
