//
//  detailsViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 2/24/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {
    var currentCollege = College()

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
    
    func setWebsite()
    {
        website1 = currentCollege.website
    }
       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let nvc = segue.destinationViewController as! websiteViewController
            nvc.website2 = website1
    }
}


