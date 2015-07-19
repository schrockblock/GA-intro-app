//
//  CoursesParser.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit
import Mantle

class CoursesParser: NSObject {
   
    func parse(data: NSData!, response: NSURLResponse!, error: NSError!) -> Array<GeneralAssemblyCourse>? {
        if (error != nil || data == nil) {
            return nil
        }
        
        let html: NSString? = NSString(data: data, encoding: NSUTF8StringEncoding)
        if let htmlString = html {
            let lines: Array = htmlString.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
            for line in lines {
                let jsonFlag: NSString = "window.EDUCATIONAL_OFFERINGS_JSON = "
                if line.rangeOfString(jsonFlag as String).location != NSNotFound {
                    let start = line.rangeOfString(jsonFlag as String).location
                    var jsonString = (line as! NSString).substringFromIndex(start + jsonFlag.length)
                    jsonString = (jsonString as NSString).substringToIndex((jsonString as NSString).length - 1)
                    
                    if jsonString.hasPrefix("[") && jsonString.hasSuffix("]") {
                        let jsonData: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
                        
                        var jsonError: NSError?
                        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments, error: &jsonError)
                        
                        if let jsonDictionary: AnyObject = json {
                            var mantleError: NSError?
                            let courses = MTLJSONAdapter.modelsOfClass(GeneralAssemblyCourse.self, fromJSONArray: jsonDictionary as! [AnyObject], error: &mantleError) as! [GeneralAssemblyCourse]
                            return courses
                        }
                    }
                }
            }
        }
        
        return nil
    }
}
