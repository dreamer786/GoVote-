//
//  MapViewController.swift
//  GoVote!
//
//  Created by Kelly Ng on 12/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import Foundation

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var scrollView : UIScrollView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = "map.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        let x = self.view.frame.size.width
        imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.contentMode = .scaleAspectFit
        //imageView.image = myMap
        
        scrollView.contentSize.width = scrollView.frame.size.width
        scrollView.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
