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
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        

        // Do any additional setup after loading the view.
        
        self.collectionView?.delegate = self
        
        self.collectionView!.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        

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

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
    
        // Configure the cell
//        cell.backgroundColor = UIColor.redColor()
        cell.viewColor.backgroundColor = UIColor.redColor()
    
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
