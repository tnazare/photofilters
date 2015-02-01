//
//  ViewController.swift
//  PhotoFilters
//
//  Created by Nazare Thibaut on 31/01/2015.
//  Copyright (c) 2015 cl2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PhotoFilterView: UIImageView!
    
    // Create a place to render the image
    let context = CIContext(options: nil)
    
    @IBAction func applyFilter(sender: AnyObject) {
        //Create the input image
        let inputImage = CIImage(image: PhotoFilterView.image)
        
        //Create a random color to pass to the filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314))/100)]
        
        // Apply a filter to the image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        
        // Render the filtered image
        let renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        
        // Applying filtered image
        PhotoFilterView.image = UIImage(CGImage: renderedImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

