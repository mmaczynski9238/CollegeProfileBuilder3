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
    /****************************************/

    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewTextField.text = location

        findLocation(location)
    }
    
    /****************************************/

    @IBAction func mapTypeSegmentedControl(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex)
        {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            mapView.mapType = .Standard
        
        }
    }
    
    /****************************************/
    func textFieldShouldReturn(mapViewTextField: UITextField) -> Bool {
        var location = mapViewTextField.text!
        mapViewTextField.resignFirstResponder()
        findLocation(location)
        return true
    }
    /****************************************/

    func findLocation(location: String)
    {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) -> Void in
            if error != nil
            {
                print(error)
            }
            else
            {
                print(placemarks)
                let alert = UIAlertController(title: "Select a location", message: nil, preferredStyle: .ActionSheet)

                    for placemark in placemarks!
                    {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler:
                        { (action) -> Void in
                            self.displayMap(placemark)
                        })
                            alert.addAction(locationAction)
                    }
                
                /****************************************/

                alert.popoverPresentationController!.sourceView = self.view
                alert.popoverPresentationController!.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
                self.presentViewController(alert, animated: true, completion: nil)

            }
        }
    }
    
    /****************************************/
    
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

