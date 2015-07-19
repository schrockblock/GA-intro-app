//
//  CoursesNetworkCall.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

class CoursesNetworkCall: BaseNetworkCall {
   
    override func execute(completion: ((NSData!, NSHTTPURLResponse!, NSError!) -> Void)) {
        endpoint = "/education?where=boston&format=classes-workshops"
        httpMethod = "GET"
        super.execute(completion);
    }
}
