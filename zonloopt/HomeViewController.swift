//
//  HomeViewController.swift
//  zonloopt
//
//  Created by Alice Zhang on 8/6/20.
//  Copyright © 2020 Alice Zhang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           manager.desiredAccuracy = kCLLocationAccuracyBest
           manager.delegate = self
           manager.requestWhenInUseAuthorization()
           manager.startUpdatingLocation()
       }
    
    @IBOutlet weak var mapView: MKMapView!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        let coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude,
                                                    location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    @IBAction func logOutAction(_ sender: UIButton) {
        //send user back
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ZonLoopt")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
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
