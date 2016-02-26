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
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = currentCollege.name
        nameLabel.text = currentCollege.name
        locationLabel.text = currentCollege.location
        numberOfStudentsLabel.text = "Number of Students: \(currentCollege.numberOfStudents)"
   
    }
    
    
}
