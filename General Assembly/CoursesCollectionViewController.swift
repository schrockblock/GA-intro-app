//
//  CoursesCollectionViewController.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/19/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

let reuseIdentifier = "courseCell"

class CoursesCollectionViewController: UICollectionViewController {
    var courses: Array<GeneralAssemblyCourse>!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "CLASSES"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return courses.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CourseCollectionViewCell
    
        let course: GeneralAssemblyCourse = courses[indexPath.row]
        if let courseImage = course.image {
            cell.imageView.image = courseImage
        }else{
            ImageDownloader.downloadImage(course.imageUrl, completion: {(image) -> Void in
                cell.imageView.image = image
                course.image = image
            })
        }
        cell.titleLabel.text = course.title
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: UIScreen.mainScreen().bounds.width/2 - 8, height: UIScreen.mainScreen().bounds.width/2 - 8)
    }

}
