//
//  CollegeClass.swift
//  CollegeProfileBuilder
//
//  Created by Student on 2/8/17.
//  Copyright © 2017 bhs. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var type = ""
    var population = ""
    var image = UIImage(named: "default")
    var url = ""
    //var image
    
    init(Name:String, Type: String, Population:String, URL: String, Image:UIImage)
    {
        name = Name
        type = Type
        population = Population
        url = URL
        image = Image
        
    }
    
    init(Name:String, Population:String, URL:String)
    {
        name = Name
        population = Population
        url = URL
    }
    
}
