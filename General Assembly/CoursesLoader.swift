//
//  CoursesLoader.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

class CoursesLoader: NSObject {
    
    func refresh(completion: ((Array<GeneralAssemblyCourse>?) -> Void)) {
        let courseCall: CoursesNetworkCall = CoursesNetworkCall()
        courseCall.execute { (data, response, error) -> Void in
            let parser: CoursesParser = CoursesParser()
            var courses: Array<GeneralAssemblyCourse>? = parser.parse(data, response: response, error: error)
            courses = courses?.filter({ (course) -> Bool in
                return course.format == "class" || course.format == "workshop"
            })
            courses = courses?.reverse()
            completion(courses)
        }
    }
   
}
