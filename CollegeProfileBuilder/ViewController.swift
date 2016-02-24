//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 2/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    var colleges:[College] = [College]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collegeZero = College(Name: "Smaug", Location: "Crown", NumberOfStudents: 32)
        colleges.append(collegeZero)
        let collegeOne = College(Name: "Alfred", Location: "Tail", NumberOfStudents: 23)
        colleges.append(collegeOne)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentCollege = colleges[indexPath.row]
        let currentCell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        currentCell.textLabel!.text = currentCollege.name

        return currentCell
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! detailsViewController
        let currentCollege = colleges[(myTableView.indexPathForSelectedRow?.row)!]
        nvc.currentCollege = currentCollege





}


}

