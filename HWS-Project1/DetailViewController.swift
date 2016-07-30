//
//  DetailViewController.swift
//  HWS-Project1
//
//  Created by Nikema Prophet on 7/30/16.
//  Copyright © 2016 Nikema Prophet. All rights reserved.
//
import Social
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    


    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(DetailViewController.shareTapped))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    func shareTapped() {
//        let activity = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
//        presentViewController(activity, animated: true, completion: nil)
        
        let social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        social.setInitialText("Hello world, buy my app!")
        social.addImage(detailImageView.image!)
        social.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(social, animated: true, completion: nil)
    }
}

