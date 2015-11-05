//
//  ZoomingIconTransition.swift
//  ZoomingIcons
//
//  Created by Adam Goldberg on 2015-11-05.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class ZoomingIconTransition: NSObject, UIViewControllerAnimatedTransitioning, UINavigationControllerDelegate {
    
    let kZoomingIconTransitionDuration = 1.0
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return kZoomingIconTransitionDuration
    }
    
    internal func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let timeConstant = NSTimeInterval(transitionDuration(transitionContext))
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containerView = transitionContext.containerView()! as UIView
        
        containerView.addSubview((fromViewController?.view)!)
        containerView.addSubview((toViewController?.view)!)
        toViewController!.view.alpha = 0
        
        
        UIView.animateWithDuration(timeConstant, animations: { () -> Void in toViewController!.view.alpha = 1
            }) { (BOOL isDone) -> Void in
                toViewController!.view.alpha = 1
                transitionContext.completeTransition(isDone)
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

//    optional internal func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }

    
}





//
//Go into the storyboard and drag Object from the Object Library onto the Navigation Controller. In the Identity Inspector, set the custom class to ZoomingIconTransition and in the navigation controller's Connections Inspector, drag the delegate outlet to this object.
//
//Next, make ZoomingIconTransition conform to UINavigationControllerDelegate and add the delegate method that returns a UIViewControllerAnimatedTransitioning and return self.
//    
//Build and run and you should see the the below fade working