//
//  DrawViewController.swift
//  handrighting
//
//  Created by Eric Mooney on 10/17/16.
//  Copyright © 2016 Red Joule. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var photoImage: UIImage!         // The image
    
    // MARK: Actions
    
    @IBAction func clear(sender: UIButton) {
        let theDrawView : DrawView = drawView as DrawView
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
    }
    
//    @IBAction func saveDrawing(sender: UIButton) {
//        UIGraphicsBeginImageContext(view.frame.size)
//        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
//        let sourceImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        UIImageWriteToSavedPhotosAlbum(sourceImage, nil, nil, nil)
//        photoImage = sourceImage
//    }
    
    func saveDrawingToPhotoLibrary() {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let sourceImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(sourceImage, nil, nil, nil)
        photoImage = sourceImage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawView.layer.borderWidth = 3.0;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("in func")
        if saveButton === sender {
            print("yes save")
            print(sender)
            //saveDrawingToPhotoLibrary()
            let NavigationController = segue.destinationViewController as! UINavigationController
            let DestinationViewController = NavigationController.topViewController as! ShowViewController
            
            // Get the info that generated this segue.
            let name = "Drawing"
            let photo = photoImage
            
            // Set the image to be passed.
            let savedImage = Image(photo: photo!, name: name, text: nil)
            DestinationViewController.image = savedImage
            
        } else {
                print("no save")
        }
    }
    

}
