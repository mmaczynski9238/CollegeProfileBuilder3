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

    override func viewDidLoad() {
        super.viewDidLoad()
        nameEditTextField.text = currentCollege.name
        locationEditTextField.text = currentCollege.location
        numberEditTextField.text = "\(currentCollege.numberOfStudents)"

    
    

        self.navigationItem.title = currentCollege.name
        imageView.image = UIImage(named: currentCollege.image)
        
        
        /*nameLabel.text = currentCollege.name
        locationLabel.text = currentCollege.location
        numberOfStudentsLabel.text = "Number of Students: \(currentCollege.numberOfStudents)"*/
    }
    @IBAction func EditSaveButton(sender: UIButton) {
        currentCollege.name = nameEditTextField.text!
        currentCollege.location = locationEditTextField.text!
        currentCollege.numberOfStudents = Int(numberEditTextField.text!)!
        
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        
        
        
        self.navigationItem.title = currentCollege.name
}
    
}
