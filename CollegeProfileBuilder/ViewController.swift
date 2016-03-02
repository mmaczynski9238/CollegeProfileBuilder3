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
    @IBOutlet weak var editBarButtonOutlet: UIBarButtonItem!
    
    var colleges:[College] = [College]()

    var nameVariable = ""
    var locationVariable = ""
    var numberOfStudentsVariable = 0
    /************************************/

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editBarButtonOutlet.tag = 0

        colleges.append(College(Name: "MIT", Location: "Cambridge, MA", NumberOfStudents: 11319, image: "mit", Website: "web.mit.edu"))
        colleges.append(College(Name: "Illinois State University", Location: "Normal, Illinois", NumberOfStudents: 20615, image: "isu", Website: "illinoisstate.edu" ))
        colleges.append(College(Name: "Harvard University", Location: "Cambridge, MA", NumberOfStudents: 21000, image: "harvard", Website: "harvard.edu"))
        
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)

    }
    
    /************************************/

    func loadList(notification: NSNotification){
        self.myTableView.reloadData()
    }
    /************************************/

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    /************************************/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let currentCollege = colleges[indexPath.row]
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        currentCell.textLabel!.text = currentCollege.name
        currentCell.detailTextLabel?.text = currentCollege.location
        return currentCell
        
        
    }
    /************************************/
    @IBAction func editBarButton(sender: UIBarButtonItem) {
        if(sender.tag == 0) {
            myTableView.editing = true
            sender.tag = 1
            editBarButtonOutlet.title = "Done"

        } else {
            myTableView.editing = false
            sender.tag = 0
            editBarButtonOutlet.title = "Edit"

        }
    }   
    /************************************/
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            colleges.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            myTableView.reloadData()
        }
    }

    /************************************/
     func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = colleges[fromIndexPath.row]
        colleges.removeAtIndex(fromIndexPath.row)
        colleges.insert(itemToMove, atIndex: toIndexPath.row)
        
    }
    
    /************************************/

    
    
     func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    /************************************/

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! detailsViewController
        let currentCollege = colleges[(myTableView.indexPathForSelectedRow?.row)!]
        nvc.currentCollege = currentCollege
    }
    
    /************************************/
     
    /************************************/

    @IBAction func addCollegeBarButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a College", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        /************************************/

        var nameField: UITextField!
        var locationField: UITextField!
        var numberField: UITextField!
        var websiteField: UITextField!

        
        func nameTextField(textField: UITextField!)
        {
            textField.placeholder = "College Name"
            nameField = textField
        }
        func locationTextField(textField: UITextField!)
        {
            textField.placeholder = "Location"
            locationField = textField
        }
        func numberTextField(textField: UITextField!)
        {
            textField.placeholder = "Number Of Students"
            numberField = textField
        }
        func websiteTextField(textField: UITextField!)
        {
            textField.placeholder = "Website"
            websiteField = textField
        }
        alert.addTextFieldWithConfigurationHandler(nameTextField)
        alert.addTextFieldWithConfigurationHandler(locationTextField)
        alert.addTextFieldWithConfigurationHandler(numberTextField)
        alert.addTextFieldWithConfigurationHandler(websiteTextField)

        /************************************/
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        /************************************/

        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default, handler:
            { (action) -> Void in
            nameField.resignFirstResponder()
                
            let numberVariable = Int(numberField.text!)
            self.colleges.append(College(Name: nameField.text!, Location: locationField.text! , NumberOfStudents: numberVariable!, image: "", Website: websiteField.text!))
            self.myTableView.reloadData()
        })
        /************************************/

        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}













