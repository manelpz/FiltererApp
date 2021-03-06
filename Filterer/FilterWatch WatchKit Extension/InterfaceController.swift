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
        
        // Configure interface objects here.
       
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    
    @IBOutlet var filterSlider: WKInterfaceSlider!
   
    
    @IBAction func onClickRed() {
         print("hey 3")
    }
    
    @IBAction func onSlide(_ value: Float) {
        
        NSLog("hey")
        print("hey 2")
        /*
        let sliderColor:Int = Int(roundf(filterSlider.value))
        filterSlider.value = roundf(filterSlider.value)
        let images = imageView.image
        let myRGBA = RGBAImage(image: OriginalImage!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = OriginalImage
        
        if (1 == 1){
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            }
        }

        */
        
        
        
        
        
    }
    
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    @IBAction func onBlueFilter() {
        
        NSLog("hey")
              print("hey 2")
        
        
        
        
        
        
    }
    
}
