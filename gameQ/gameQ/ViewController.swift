//
//  ViewController.swift
//  gameQ
//
//  Created by student on 11/14/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var square: UIView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var snap: UISnapBehavior!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        square = UIView(frame: CGRect(x: 0, y: 650, width: 90, height: 30))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        
        
        
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 30, height: 30))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        
        let barrier2 = UIView(frame: CGRect(x: 30, y: 100, width: 30, height: 30))
        barrier2.backgroundColor = UIColor.greenColor()
        view.addSubview(barrier2)
        
        let barrier3 = UIView(frame: CGRect(x: 60, y: 100, width: 30, height: 30))
        barrier3.backgroundColor = UIColor.blueColor()
        view.addSubview(barrier3)
        
        let barrier4 = UIView(frame: CGRect(x: 120, y: 100, width: 30, height: 30))
        barrier4.backgroundColor = UIColor.blueColor()
        view.addSubview(barrier4)
        
        
        
        
        
        collision = UICollisionBehavior(items: [square,barrier,barrier2,barrier3,barrier4])
        collision.translatesReferenceBoundsIntoBoundary = true
        
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [barrier,barrier2,barrier3,barrier4])
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [barrier,barrier2,barrier3,barrier4])
        itemBehaviour.elasticity = 1
        animator.addBehavior(itemBehaviour)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  touchesMoved(touches: NSSet,withEvent event:UIEvent){
        if(snap != nil){
            animator.removeBehavior(snap)
            
        }
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
        
    }
    
    
}

