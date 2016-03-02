//
//  websiteViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 3/1/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class websiteViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    var website2 = String()
    @IBOutlet weak var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var myString = "http://www." + website2
        let myURL = NSURL(string: myString)
        let myReq = NSURLRequest(URL: myURL!)
        webView.loadRequest(myReq)
        view.addSubview(webView)
        
    }
    
    
    func webViewDidStartLoad(myWebView: UIWebView ) {
        self.webView.alpha = 0
        activityView.startAnimating() }
    
    func webViewDidFinishLoad(myWebView:  UIWebView ) {
        self.webView.alpha = 1

        activityView.stopAnimating() }
    

    
    @IBAction func doneButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
