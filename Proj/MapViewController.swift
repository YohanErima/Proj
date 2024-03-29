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


class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {



    var enigma : Egnime!
    @IBOutlet weak var Photo: UIBarButtonItem!
    @IBOutlet weak var mode: UIBarButtonItem!
    @IBOutlet weak var MapVieew: MKMapView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var Radius : CLLocationDistance = 100.0
    var monitorRegion = CLCircularRegion()
    
    @IBOutlet weak var Laura: UIImageView!
    @IBOutlet weak var Dialog: UITextView!
    
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
        let tap = UITapGestureRecognizer(target : self ,action: Selector(("doubleTapped")))
        tap.numberOfTapsRequired = 3
        MapVieew.addGestureRecognizer(tap)
        Laura.layer.zPosition = 1
        Dialog.layer.zPosition = 2
        self.monitorRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(-33.8634, 151.211), radius: Radius, identifier: "Lieu à découvrir")
        
        
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
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            /*let alertController = UIAlertController(title: nil, message: "t'a secoué le téléphone ",preferredStyle:UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true,completion: nil)*/
            Toast.long(message: NSLocalizedString("message_d'aide", comment: "message"), success: "1", failer: "0")
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                self.present(imagePickerController,animated: true,completion: nil)
                           
            }else {
                print(NSLocalizedString("soit ta camera est cassée ou soit tu fais sur un émulateur donc tu n'as pas acces à la caméra ", comment: "actionsheet"))
                locationManager.startMonitoring(for: self.monitorRegion)
                var localisation = CLLocation(latitude:(MapVieew.userLocation.location?.coordinate.latitude)!,longitude:(MapVieew.userLocation.location?.coordinate.longitude)!)
                var dist = CLLocation(latitude: -20.905108, longitude: 55.50038).distance(from: localisation)
                if (dist<self.Radius){
                    let alert = UIAlertController(title: NSLocalizedString("Felicitaion", comment: "Message"),
                                                  message: NSLocalizedString("message de reussite", comment: "Message"), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                Laura.isHidden = false
                Dialog.isHidden = true
                
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let Myimg = info[UIImagePickerControllerOriginalImage]
            
        
        
        
        let imagedata = UIImagePNGRepresentation(Myimg as! UIImage)
        let compressedImage = UIImage(data : imagedata!)
        
        UIImageWriteToSavedPhotosAlbum(compressedImage!, nil , nil ,nil)
        
        let alert = UIAlertController(title: "Sved ",message : "Your image has been saved", preferredStyle : .alert)
        
        let ok = UIAlertAction(title : "ok" , style: .default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil )
        picker.dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    @objc func doubleTapped() {
        ///enigma.getAllDialog()
        
        if (Laura.isHidden == false && Dialog.isHidden == false){
            Laura.isHidden = true
            Dialog.isHidden = true
        } else {
            Laura.isHidden = false
            Dialog.isHidden = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("registering region", region)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let alert = UIAlertController(title: NSLocalizedString("beware", comment: "Message"),
                                      message: NSLocalizedString("enter", comment: "Message"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        if let r = region {
            print("Could not monitor region", r.description)
        }
        print(error)
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
