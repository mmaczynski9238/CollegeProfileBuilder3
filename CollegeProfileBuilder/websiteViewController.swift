//
//  websiteViewController.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 3/1/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class websiteViewController: UIViewController {
    var website2 = String()
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // var websiteURL = NSURL(string: "https://apple.com")
        var websiteURL = NSURL(string: website2)
        
        var urlRequest = NSURLRequest(URL: websiteURL!);
        webView.loadRequest(urlRequest)
    }
    

}
