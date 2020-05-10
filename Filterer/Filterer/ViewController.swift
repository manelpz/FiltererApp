//
//  ViewController.swift
//  Filterer
//
//  Created by Emmanuel Lopez Guerrero on 5/9/20.
//  Copyright © 2020 Emmanuel Lopez Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let image = UIImage(named: "sample")!
        
        var myRGBA = RGBAImage(image: image)
        
        let avgRed = 83
        let avgBlue = 98
        let avgGreen = 98
    
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y * myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                let RedDiff = Int(pixel.red) - avgRed
                let BlueDiff = Int(pixel.blue) - avgBlue
                let GreenDiff = Int(pixel.green) - avgGreen
                
                if(RedDiff>0)
                {
                    pixel.red = UInt8( max(0,min(255,avgRed + (RedDiff+20))))
                    myRGBA!.pixels[index] = pixel
                    
                    pixel.blue = UInt8( max(0,min(255,avgBlue + (BlueDiff+30))))
                    myRGBA!.pixels[index] = pixel
                }
            }
        }
    
    let mewImage2 = myRGBA!.toUIImage()
        
        
        
        
        
        
    }


}

