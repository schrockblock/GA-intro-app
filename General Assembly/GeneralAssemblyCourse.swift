//
//  GeneralAssemblyCourse.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit
import Mantle

class GeneralAssemblyCourse: MTLModel, MTLJSONSerializing {
    var imageUrl: String!
    var title: String!
    var format: String!
    var shortDescription: String!
    var instructors: Array<GAInstructor>!
    
    class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return ["imageUrl":"image_url", "title":"title", "format":"format", "shortDescription":"overview", "instructors":"instructors"]
    }
    
    class func JSONTransformerForKey(key: String!) -> NSValueTransformer! {
        if key == "instructors" {
            return MTLJSONAdapter.arrayTransformerWithModelClass(GAInstructor)
        }
        
        return nil
    }
}
