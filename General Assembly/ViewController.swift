//
//  ViewController.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let coursesLoader = CoursesLoader()
        coursesLoader.refresh { (courses) -> Void in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

