//
//  PhotoView.swift
//  Filterer
//
//  Created by Emmanuel Lopez Guerrero on 10/23/20.
//  Copyright © 2020 Emmanuel Lopez Guerrero. All rights reserved.
//

import UIKit

class PhotoView: UIImageView {

    var lastTouchTime: NSDate? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let currentTime = NSDate()
        
        if let previousTime = lastTouchTime{
            if currentTime.timeIntervalSince(previousTime as Date) < 0.5{
                print("double tap")
                lastTouchTime = nil
            }else {
                lastTouchTime = currentTime
            }
        }else{
            lastTouchTime =  currentTime
        }

    }

    
}
