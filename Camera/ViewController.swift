//
//  ViewController.swift
//  Camera
//
//  Created by Irene Chen on 9/16/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    @IBAction func captureButtonPressed(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .Camera
            imagePickerController.allowsEditing = false
            
            
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //Dismiss view controller
        self.dismissViewControllerAnimated(true) { () -> Void in}
        
        self.imageView.image = image
        
        //Bonus
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        //
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            //
        })
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

