//
//  MapViewController.swift
//  Proj
//
//  Created by etudiant on 28/10/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {



    @IBOutlet weak var Photo: UIBarButtonItem!
    @IBOutlet weak var mode: UIBarButtonItem!
    @IBOutlet weak var MapVieew: MKMapView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    
    @IBOutlet weak var ici: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            
            locationManager.requestWhenInUseAuthorization()
            
             MapVieew.showsUserLocation = true
        }
        else {
            let alert = UIAlertController(title: NSLocalizedString("error", comment: "Error"),
                                          message: NSLocalizedString("location not enabled", comment: "Error"),
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    

    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        currentLocation = userLocation.location
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        let alert = UIAlertController(title: NSLocalizedString("error", comment: "Error"),
                                      message: NSLocalizedString("failed to update map", comment: "Error"),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "dmi")
        pin.pinTintColor = UIColor.red
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }
    
    @IBAction func locUser(_ sender: Any) {
        let userLocation = MapVieew.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!,2000,2000)
        MapVieew.setRegion(region, animated: true)    }
    
           
    @IBAction func sat(_ sender: Any) {
        MapVieew.mapType = .satellite
        
            
        
    }
    
    @IBAction func tohybrid(_ sender: Any) {
        MapVieew.mapType = .hybrid
    }
    
    @IBAction func toStan(_ sender: Any) {
        MapVieew.mapType = .standard
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
