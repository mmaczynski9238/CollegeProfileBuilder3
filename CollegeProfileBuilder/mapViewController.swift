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
        
        
        mapViewTextField.text = location
        findLocation(location)
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let location = mapViewTextField.text!
        textField.resignFirstResponder()
        findLocation(location)
        return true
    }
    
    func findLocation(location: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil{
                print(error)
            }
            else
            {
                
                if placemarks!.count > 1 {
                    let actionSheetAlert = UIAlertController(title: "Please Choose a Location", message: nil, preferredStyle: .ActionSheet)
                    
                    
                    for placemark in placemarks!
                    {
                        let locationAlert = UIAlertAction(title: placemark.name!, style: .Default
                            , handler: { (action) -> Void in
                                self.showOnMap(placemark)
                        })
                        actionSheetAlert.addAction(locationAlert)
                    }
                    let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                    actionSheetAlert.addAction(cancel)
                    self.presentViewController(actionSheetAlert, animated: true, completion: nil)
                }else if placemarks?.count == 1 {
                    let placemark = placemarks!.first as CLPlacemark!
                    self.showOnMap(placemark)}
            }
        }
    }
    
    
    
    func showOnMap(placemark: CLPlacemark)
    {
        mapViewTextField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        
        pin.coordinate = center
        pin.title = placemark.name
        
        mapView.addAnnotation(pin)
        mapView.setRegion(region, animated: true)
    }
}
