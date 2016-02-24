//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Michael Maczynski on 2/24/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation


class College
{
    var name: String
    var location: String
    var numberOfStudents: Int
    
    init(Name n:String,Location l:String, NumberOfStudents s: Int)
    {
        name = n
        location = l
        numberOfStudents = s
    }
    
    init()
    {
        name = ""
        location = ""
        numberOfStudents = 0
    }
}