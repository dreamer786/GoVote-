//
//  MapViewController.swift
//  GoVote!
//
//  Created by Kelly Ng on 12/9/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var state:String = ""
    
    let locationManager = CLLocationManager()
    var location: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        locationManager.requestLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        /*if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
        }*/
        self.location = locations.last as CLLocation!
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?) -> Void ) {

        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil {
                    let myLocation = placemarks?[0]
                    if myLocation?.administrativeArea != nil {
                        self.state = (myLocation?.administrativeArea)!
                        print(self.state)
                    }
                    completionHandler(myLocation)
                }
                else {
                    completionHandler(nil)
                }
            })
        }
        else {
            completionHandler(nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        let myDestination = segue.destination as! MapResultsViewController
        
        myDestination.state = state
        
        
    }
    

}
