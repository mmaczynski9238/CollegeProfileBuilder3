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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = currentCollege.name

   
    }
    
    
}
