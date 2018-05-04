//
//  ViewController.swift
//  Current_UserLoc
//
//  Created by mister.springroll on 2018/3/12.
//  Copyright © 2018年 mister.springroll. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var MAP: MKMapView!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var Speed: UILabel!
    
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        MAP.setRegion(region, animated: true);
        self.MAP.showsUserLocation = true
        latitude.text = "\(String(format:"Lat: %.5f", location.coordinate.latitude))"
        longitude.text = "\(String(format:"Lon: %.5f", location.coordinate.longitude))"
        Speed.text = "\(String(format:"Speed: %.2f", location.speed))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

