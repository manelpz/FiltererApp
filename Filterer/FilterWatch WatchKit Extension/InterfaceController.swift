//
//  InterfaceController.swift
//  FilterWatch WatchKit Extension
//
//  Created by Emmanuel Lopez Guerrero on 02/03/21.
//  Copyright © 2021 Emmanuel Lopez Guerrero. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet var image: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        
        super.willActivate()
    }
    
    
    @IBOutlet var filterSlider: WKInterfaceSlider!
   
    
    @IBAction func onClickRed() {
         print("hey 3")
    }
    
    @IBAction func onSlide(_ value: Float) {
        print("hey 2")
    }
        
    
    override func didDeactivate() {
       
        super.didDeactivate()
    }
    
    
    @IBAction func onBlueFilter() {
              print("hey 2")
    }
    
}
