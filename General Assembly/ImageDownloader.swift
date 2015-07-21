//
//  ImageDownloader.swift
//  General Assembly
//
//  Created by Elliot Schrock on 7/19/15.
//  Copyright (c) 2015 Thryv. All rights reserved.
//

import UIKit

class ImageDownloader: NSObject {
    
    class func downloadImage(urlString: String, completion: ((UIImage?) -> Void)) {
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: urlString)!), queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
            completion(UIImage(data: data))
        })
    }
   
}
