//
//  detailsViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 2/24/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentCollege = College()
    let imagepicker = UIImagePickerController()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfStudentsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameEditTextField: UITextField!
    @IBOutlet weak var locationEditTextField: UITextField!
    @IBOutlet weak var numberEditTextField: UITextField!
    @IBOutlet weak var websiteEditTextField: UITextField!

    var website1 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self

        
        nameEditTextField.text = currentCollege.name
        locationEditTextField.text = currentCollege.location
        numberEditTextField.text = "\(currentCollege.numberOfStudents)"
        websiteEditTextField.text = "\(currentCollege.website)"
        
        self.navigationItem.title = currentCollege.name
        imageView.image = UIImage(named: currentCollege.image)
        
        website1 = currentCollege.website
    }
    
    @IBAction func openWebsiteButton(sender: UIButton) {
        website1 = websiteEditTextField.text!
    }
    
    
    @IBAction func EditSaveButton(sender: UIButton) {
        currentCollege.name = nameEditTextField.text!
        currentCollege.location = locationEditTextField.text!
        currentCollege.numberOfStudents = Int(numberEditTextField.text!)!
        currentCollege.website = websiteEditTextField.text!
        website1 = currentCollege.website
        
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
        
        
        self.navigationItem.title = currentCollege.name
    }
    
    
    @IBAction func cameraButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            imagepicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagepicker, animated: true, completion: nil)
        }
        else
        {
            imagepicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagepicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func importPhotoButton(sender: UIButton) {
        imagepicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagepicker, animated: true, completion: nil)
    }
        

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        imagepicker.dismissViewControllerAnimated(true, completion: {
            
            
            var selectedImage = info[UIImagePickerControllerOriginalImage]
                as! UIImage
            self.imageView.image = selectedImage
        })
        
        
    }
    
    func setWebsite()
    {
        website1 = currentCollege.website
    }
   /*     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let nvc = segue.destinationViewController as! websiteViewController
            nvc.website2 = website1
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(sender?.tag == 1) {
            let wvc = segue.destinationViewController as! mapViewController
            wvc.location = currentCollege.location
        }
    }
*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "webViewSegue" {
            let wvc = segue.destinationViewController as! websiteViewController
            wvc.website2 = self.website1
        } else if segue.identifier == "mapViewSegue" {
            let mvc = segue.destinationViewController as! mapViewController
            mvc.location = currentCollege.location
        }
    }
    
    
}


