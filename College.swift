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
    var image: String

    
    init(Name n:String,Location l:String, NumberOfStudents s: Int, image i: String)
    {
        name = n
        location = l
        numberOfStudents = s
        image = i

    }
    
    init()
    {
        name = ""
        location = ""
        numberOfStudents = 0
        image = ""
    }
}