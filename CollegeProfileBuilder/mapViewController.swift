//
//  mapViewController.swift
//  CollegeProfileBuilder3
//
//  Created by Michael Maczynski on 3/2/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var mapViewTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var location : String = "";
    override func viewDidLoad() {
        super.viewDidLoad()


        findLocation(location)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let locationName = textField.text!
        textField.resignFirstResponder()
        findLocation(locationName)
        return true
    }
    
    func findLocation(locationName: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                if placemarks!.count > 1
                {
                    let alert = UIAlertController(title: "Select a location", message: nil, preferredStyle: .Alert)
                    for placemark in placemarks!
                    {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    alert.addAction(cancelAction)
                    if let popoverController = alert.popoverPresentationController {
                        popoverController.sourceView = self.view
                        popoverController.sourceRect = self.view.bounds
                    }
                    //alert.popoverPresentationController?.sourceView = self.view
                    //alert.popoverPresentationController?.sourceRect = self.view.bounds
                    self.presentViewController(alert, animated: true, completion: nil)
                }
                else if placemarks?.count == 1{
                    let placemark = placemarks!.first as CLPlacemark!
                    self.displayMap(placemark)
                }
            }
        }
    }
    
    func displayMap(placemark: CLPlacemark) {
        mapViewTextField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(1.0, 1.0)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
    
    
    
}




/*
        geoCodeLocation(location)
        
    }
    
    func geoCodeLocation(Location: String)
    {
        let myGeoCode = CLGeocoder()
        myGeoCode.geocodeAddressString(Location) { (placeMarks, error) -> Void in
            if error != nil
            {
                print("error")
            }
            else
            {
                self.displayMap((placeMarks?.first)!)
            }
        }
    }
    
    
    
    
    func displayMap(placemark: CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        location = placemark.name!
        let myLocation = placemark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        mapView.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = placemark.name
        mapView.addAnnotation(myPin)
            }
}




























*/
