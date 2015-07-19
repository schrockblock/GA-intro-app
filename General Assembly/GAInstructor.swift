//
//  GAInstructor.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/19/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit
import Mantle

class GAInstructor: MTLModel, MTLJSONSerializing {
    var name: String!
    var title: String!
    
    class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["name":"name", "title":"title"]
    }
}
