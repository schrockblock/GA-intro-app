//
//  ViewController.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/18/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var courses: Array<GeneralAssemblyCourse>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        let coursesLoader = CoursesLoader()
        coursesLoader.refresh { (courses) -> Void in
            self.courses = courses
            self.performSegueWithIdentifier("doneLoading", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ((segue.destinationViewController as! UINavigationController).viewControllers[0] as! CoursesCollectionViewController).courses = courses
    }

}

