//
//  DragImg.swift
//  mylittlemonster
//
//  Created by Ziga Strgar on 04/07/16.
//  Copyright © 2016 Ziga Strgar. All rights reserved.
//

import Foundation
import UIKit

class DragImg : UIImageView {
    
    var originalPosition: CGPoint!
    
    var dropTarget: UIView?
    
    override init(frame: CGRect){
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first, let target = dropTarget {
            let position = touch.locationInView(self.superview)
            
            if CGRectContainsPoint(target.frame, position) {
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "onTargetDropped", object: nil))
            }
        }
        
        self.center = originalPosition
    }

}