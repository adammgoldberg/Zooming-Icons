//
//  DetailViewController.swift
//  ZoomingIcons
//
//  Created by Adam Goldberg on 2015-11-05.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var companyLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var backgroundView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
