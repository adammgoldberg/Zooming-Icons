//
//  MenuViewController.swift
//  ZoomingIcons
//
//  Created by Adam Goldberg on 2015-11-05.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var socialItemsArray = [SocialItem]()



    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectionView?.delegate = self
        
        self.collectionView!.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        
        socialItemsArray = [
            SocialItem(image: UIImage(named: "icon-twitter")!, colour: UIColor(red: 0.255, green: 0.557, blue: 0.910, alpha: 1), name: "Twitter", summary: "Twitter is an online social networking service that enables users to send and read short 140-character messages called 'tweets'."),

        
            SocialItem(image: UIImage(named: "icon-facebook")!, colour: UIColor(red: 0.239, green: 0.353, blue: 0.558, alpha: 1), name: "Facebook", summary: "Facebook (formerly thefacebook) is an online social networking service headquartered in Menlo Park, California. Its name comes from a colloquialism for the directory given to students at some American universities."),
            
            SocialItem(image: UIImage(named: "icon-youtube")!, colour: UIColor(red: 0.729, green: 0.188, blue: 0.180, alpha: 1), name: "YouTube", summary: "YouTube is a video-sharing website headquartered in San Bruno, California. The service was created by three former PayPal employees in February 2005 and has been owned by Google since late 2006. The site allows users to upload, view, and share videos."),
            
            SocialItem(image: UIImage(named: "icon-vimeo")!, colour: UIColor(red: 0.329, green: 0.737, blue: 0.988, alpha: 1), name: "Vimeo", summary: "Vimeo is a U.S.-based video-sharing website on which users can upload, share and view videos. Vimeo was founded in November 2004 by Jake Lodwick and Zach Klein."),
            
            SocialItem(image: UIImage(named: "icon-instagram")!, colour: UIColor(red: 0.325, green: 0.498, blue: 0.635, alpha: 1), name: "Instagram", summary: "Instagram is an online mobile photo-sharing, video-sharing and social networking service that enables its users to take pictures and videos, and share them on a variety of social networking platforms, such as Facebook, Twitter, Tumblr and Flickr.")
            
            
            ]

        
        
        
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let itemsInSection = self.collectionView(collectionView, numberOfItemsInSection: section)
        let itemWidth = (collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width
        let collectionViewWidth = self.collectionView?.bounds.width
        let itemsTotalWidth : CGFloat = CGFloat(itemsInSection) * itemWidth + CGFloat(itemsInSection) * 10.0
        
        let insetLength = (collectionViewWidth! - itemsTotalWidth) / 2
        
        
        return UIEdgeInsets(top: 10, left: insetLength, bottom: 10, right: insetLength)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if (section == 0) {
            return 2
        }
        else {
        return 3
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let offset = (indexPath.section == 0) ? 0 : 2
        let theItem : SocialItem = socialItemsArray[indexPath.item + offset]
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailView") as! DetailViewController
        let view = dvc.view //this was an annoying bug. was a necessary line. thanks peter!
        dvc.backgroundView.backgroundColor = theItem.colour
        dvc.imageView.image = theItem.image
        dvc.companyLabel.text = theItem.name
        dvc.descriptionLabel.text = theItem.summary
        self.navigationController?.pushViewController(dvc, animated: true)
    }

    
// IF I don't want to do a stupid, convoluted transition, use this method!
//    func switchScreen() {
//        let tvc = self.storyboard?.instantiateViewControllerWithIdentifier("DetailView") as! DetailViewController
//        UIView.transitionFromView(self.view, toView: tvc.view, duration: 3, options: UIViewAnimationOptions.TransitionCrossDissolve) { (isFinished) -> Void in
//            self.navigationController?.pushViewController(tvc, animated: true)
//        }
//    }
    
    
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        

        let offset = (indexPath.section == 0) ? 0 : 2
        let socItem : SocialItem = socialItemsArray[indexPath.item + offset]
        
        cell.socialItem = socItem

        // Configure the cell
//        cell.backgroundColor = UIColor.redColor()
        cell.viewColor.backgroundColor = cell.socialItem?.colour
        cell.imageView.image = cell.socialItem?.image
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
