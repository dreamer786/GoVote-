//
//  GeneralInfoViewController.swift
//  GoVote!
//
//  Created by Mahataz Khandaker on 11/29/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class GeneralInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        webView.loadHTMLString("<iframe src=\"https://register.vote.org/?partner=111111&campaign=free-tools\" width=\"\(webView.frame.width)\" marginheight=\"\(webView.frame.height)\" frameborder=\"0\" id=\"frame1\" scrollable =\"no\"></iframe><script type=\"text/javascript\" src=\"//cdnjs.cloudflare.com/ajax/libs/iframe-resizer/3.5.3/iframeResizer.min.js\"></script><script type=\"text/javascript\">iFrameResize({ log:true, checkOrigin:false});</script>", baseURL: nil)
        */
        /*
        webView.loadHTMLString("<iframe src=\"https://reminders.vote.org/?partner=111111&campaign=free-tools\" width=\"\(webView.frame.width)\" marginheight=\"\(webView.frame.height)\" frameborder=\"0\" id=\"frame4\" scrollable =\"no\"></iframe><script type=\"text/javascript\" src=\"//cdnjs.cloudflare.com/ajax/libs/iframe-resizer/3.5.3/iframeResizer.min.js\"></script><script type=\"text/javascript\">iFrameResize({ log:true, checkOrigin:false});</script>", baseURL: nil)
         */
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerToVote(_ sender: Any) {
        let vc: VoterViewController = storyboard?.instantiateViewController(withIdentifier: "register") as! VoterViewController
        vc.str = "<iframe src=\"https://register.vote.org/?partner=111111&campaign=free-tools\" width=\"100%\" marginheight=\"0\" frameborder=\"0\" id=\"frame1\" scrollable =\"no\"></iframe><script type=\"text/javascript\" src=\"//cdnjs.cloudflare.com/ajax/libs/iframe-resizer/3.5.3/iframeResizer.min.js\"></script><script type=\"text/javascript\">iFrameResize({ log:true, checkOrigin:false});</script>"
        show(vc, sender: nil)
    }
    @IBAction func electionReminder(_ sender: Any) {
        let vc: VoterViewController = storyboard?.instantiateViewController(withIdentifier: "register") as! VoterViewController
        
        vc.str = "<iframe src=\"https://reminders.vote.org/?partner=111111&campaign=free-tools\" width=\"100%\" marginheight=\"0\" frameborder=\"0\" id=\"frame4\" scrollable =\"no\"></iframe><script type=\"text/javascript\" src=\"//cdnjs.cloudflare.com/ajax/libs/iframe-resizer/3.5.3/iframeResizer.min.js\"></script><script type=\"text/javascript\">iFrameResize({ log:true, checkOrigin:false});</script>"
        show(vc, sender: nil)
        
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
