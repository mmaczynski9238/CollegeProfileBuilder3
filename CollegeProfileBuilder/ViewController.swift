//
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 2/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var templabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    var colleges:[College] = [College]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collegeZero = College(Name: "College 1", Location: "Illinois", NumberOfStudents: 20000)
        colleges.append(collegeZero)
        let collegeOne = College(Name: "College 2", Location: "Florida", NumberOfStudents: 23000)
        colleges.append(collegeOne)
        let collegeTwo = College(Name: "College 3", Location: "California", NumberOfStudents: 21000)
        colleges.append(collegeTwo)
        var collegeThree = College(Name: "", Location: "", NumberOfStudents: 0)
        self.colleges.append(collegeThree)
        
        //myTableView.delegate = self
        //myTableView.dataSource = self
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentCollege = colleges[indexPath.row]
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        currentCell.textLabel!.text = currentCollege.name

        return currentCell
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! detailsViewController
        let currentCollege = colleges[(myTableView.indexPathForSelectedRow?.row)!]
        nvc.currentCollege = currentCollege
    }
    
    @IBAction func addCollegeBarButton(sender: UIBarButtonItem) {
    
        var nameField: UITextField!
        var locationField: UITextField!
        var numberField: UITextField!

        
        func nameTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter a college"
            nameField = textField
        }
        func locationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter the location"
            locationField = textField
        }
        func numberTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter the number of students"
            numberField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        var alert = UIAlertController(title: "Enter a College", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler(nameTextField)
        alert.addTextFieldWithConfigurationHandler(locationTextField)
        alert.addTextFieldWithConfigurationHandler(numberTextField)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:handleCancel))
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler:{
            
            (UIAlertAction)in
            
           // var collegeThree = College(Name: "College 3", Location: "California", NumberOfStudents: 21000)
            //self.colleges.append(collegeThree)
           // print("Done !!")
            //print("Item : \(tField.text)")
            self.templabel.text = nameField.text! + "  " + locationField.text! + "  " + numberField.text!
        }
            ))
        self.presentViewController(alert, animated: true, completion: {
            print("completion block")
        })
    }

}

