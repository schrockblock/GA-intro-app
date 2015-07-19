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
            let courses: Array<GeneralAssemblyCourse>? = parser.parse(data, response: response, error: error)
            completion(courses)
        }
    }
   
}
