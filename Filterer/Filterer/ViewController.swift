//
//  ViewController.swift
//  Filterer
//
//  Created by Emmanuel Lopez Guerrero on 5/9/20.
//  Copyright © 2020 Emmanuel Lopez Guerrero. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIScrollViewDelegate {

    var redFlag:Int = 0, blueFlag:Int=0, greenFlag:Int=0, yellowFlag:Int=0, darkFlag:Int=0
    var OriginalImage: UIImage?
    var filteredImage: UIImage?
    
    @IBOutlet var zoomTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var secundaryMenu: UIView!
    @IBOutlet var sliderMenu: UIView!
    @IBOutlet var filterSlider: UISlider!
    @IBOutlet var buttonMenu: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewfiltered: UIImageView!
    @IBOutlet var EditButton: UIButton!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var compareButton: UIButton!
    @IBOutlet var OriginalImageLabel: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.4) {
            self.scrollView.zoomScale = 1.5 * self.scrollView.zoomScale
        }
    }
    
    @IBAction func onSlider(_ sender: UISlider) {
        let sliderColor:Int = Int(roundf(filterSlider.value))
        filterSlider.value = roundf(filterSlider.value)
        let images = imageView.image
        let myRGBA = RGBAImage(image: OriginalImage!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = OriginalImage
        
        if (redFlag == 1){
           
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 2:
                filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 3:
                filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.high, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            default:
                filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
            }
            
        }
        if (blueFlag == 1){
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageTemperatureCold(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 2:
                filteredImage = PhotoFilter.FilterImageTemperatureCold(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 3:
                filteredImage = PhotoFilter.FilterImageTemperatureCold(Level: LevelFilter.high, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            default:
                filteredImage = PhotoFilter.FilterImageTemperatureCold(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
            }
        }
        if (greenFlag == 1){
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageTemperatureHot(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 2:
                filteredImage = PhotoFilter.FilterImageTemperatureHot(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 3:
                filteredImage = PhotoFilter.FilterImageTemperatureHot(Level: LevelFilter.high, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            default:
                filteredImage = PhotoFilter.FilterImageTemperatureHot(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
            }
        }
        if (yellowFlag == 1){
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageBright(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 2:
                filteredImage = PhotoFilter.FilterImageBright(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 3:
                filteredImage = PhotoFilter.FilterImageBright(Level: LevelFilter.high, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            default:
                filteredImage = PhotoFilter.FilterImageBright(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
            }
        }
        if (darkFlag == 1){
            switch sliderColor {
            case 1:
                filteredImage = PhotoFilter.FilterImageDark(Level: LevelFilter.low, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 2:
                filteredImage = PhotoFilter.FilterImageDark(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            case 3:
                filteredImage = PhotoFilter.FilterImageDark(Level: LevelFilter.high, avgColor: ColorDictionary, myRGBA: myRGBA!)
                imageView.image = filteredImage
            default:
                filteredImage = PhotoFilter.FilterImageDark(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
            }
        }
        
    }
    
    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected){
            hiddenMenu()
            sender.isSelected = false
        }else{
            showSecondaryMenu()
            hiddenSliderMenu()
            EditButton.isSelected = false
            sender.isSelected = true
        }
    }
    
    @IBAction func onEdit(_ sender: UIButton) {
         if (sender.isSelected){
            hiddenMenu()
            hiddenSliderMenu()
            sender.isSelected = false
        }else{
            hiddenMenu()
            showSliderMenu()
            filterButton.isSelected = false
            sender.isSelected = true
        }
    }
    
    func showSliderMenu(){
        view.addSubview(sliderMenu)
        sliderMenu.translatesAutoresizingMaskIntoConstraints = false
        sliderMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        let bottomConstraint = sliderMenu.bottomAnchor.constraint(equalTo: buttonMenu.topAnchor)
        let leftConstraint = sliderMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = sliderMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let heightConstraint =  sliderMenu.heightAnchor.constraint(equalToConstant: 44)
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        self.sliderMenu.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.sliderMenu.alpha = 1.0
        }
    }
    
    func hiddenSliderMenu(){
        UIView.animate(withDuration: 0.4, animations: {
            self.secundaryMenu.alpha = 1.0
        }){completed in
            if completed == true{
        self.sliderMenu.removeFromSuperview()
            }
        }
    }
    
    @IBAction func onNewPhoto(_ sender: Any) {
        let actionSheet = UIAlertController(title: "New photo", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title:"Camera", style: .default, handler: {action in
            self.showCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: {action in
            self.showAlbum()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        present(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum(){
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        present(cameraPicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        imageView.image = image
        OriginalImage = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    
    func hiddenMenu(){
        UIView.animate(withDuration: 0.4, animations: {
            self.secundaryMenu.alpha = 1.0
        }){completed in
            if completed == true{
            self.secundaryMenu.removeFromSuperview()
            }
        }
    }

    func showUIViewFiltered(){
        UIView.animate(withDuration: 0.4){
            self.imageView.alpha = 0
            self.imageViewfiltered.alpha = 1
        }
    }
    
    func hiddenUIViewFiltered(){
        UIView.animate(withDuration: 0.4){
            self.imageView.alpha = 1
            self.imageViewfiltered.alpha = 0
        }
    }
    
    func showSecondaryMenu(){
        view.addSubview(secundaryMenu)
        let bottomConstraint = secundaryMenu.bottomAnchor.constraint(equalTo: buttonMenu.topAnchor)
        let leftConstraint = secundaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secundaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let heightConstraint =  secundaryMenu.heightAnchor.constraint(equalToConstant: 54)
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        self.secundaryMenu.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.secundaryMenu.alpha = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @objc func tapGestures(sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
                imageView.image = OriginalImage
                OriginalImageLabel.isHidden = false
        }
        if sender.state == .ended{
                imageView.image = filteredImage
                OriginalImageLabel.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageViewfiltered.alpha = 0
        imageView.isUserInteractionEnabled = true
        imageViewfiltered.isUserInteractionEnabled = true
        OriginalImageLabel.isHidden = true
        //zoomTapGestureRecognizer.numberOfTapsRequired = 2
        let tapGestures = UILongPressGestureRecognizer(target: self, action:  #selector(self.tapGestures))
        imageView.addGestureRecognizer(tapGestures)
        compareButton.isEnabled = false
        EditButton.isEnabled = false
        OriginalImage = imageView.image
        secundaryMenu.translatesAutoresizingMaskIntoConstraints = false
        secundaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
    }
    
    /*Compare button*/
    @IBAction func onCompare(_ sender: UIButton) {
       
        if (sender.isSelected){
            showUIViewFiltered()
            imageView.image = OriginalImage
            sender.isSelected = false
        }else{
            hiddenUIViewFiltered()
            imageViewfiltered.image = filteredImage
            sender.isSelected = true
        }
    }
    
    /*SecondaryDarkFilter*/
    @IBAction func onSecondaryPurpleFilter(_ sender: UIButton) {
        let images = imageView.image
        let myRGBA = RGBAImage(image: images!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        
        filteredImage = PhotoFilter.FilterImageDark(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
        
        imageView.image = filteredImage
        compareButton.isEnabled = true
        EditButton.isEnabled = true
        darkFlag = 1
    }
    
    
    /*SecondaryYellowFilter*/
    @IBAction func onSecondaryYellowFilter(_ sender: UIButton) {
        let images = imageView.image
        let myRGBA = RGBAImage(image: images!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = PhotoFilter.FilterImageBright(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
        
        imageView.image = filteredImage
        compareButton.isEnabled = true
        EditButton.isEnabled = true
        yellowFlag = 1
    }
    
    
    /*SecondaryBlueFilter*/
    @IBAction func onSecondaryBlueFilter(_ sender: UIButton) {
        let images = imageView.image
        let myRGBA = RGBAImage(image: images!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = PhotoFilter.FilterImageTemperatureCold(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
        
        imageView.image = filteredImage
        compareButton.isEnabled = true
        EditButton.isEnabled = true
        blueFlag = 1

    }
    
    
    /*SecondaryGreenFilter*/
    @IBAction func onSecondaryGreenFilter(_ sender: UIButton) {
        let images = imageView.image
        let myRGBA = RGBAImage(image: images!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = PhotoFilter.FilterImageTemperatureHot(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
        
        imageView.image = filteredImage
        compareButton.isEnabled = true
        EditButton.isEnabled = true
        greenFlag = 1
    }
    
    /*SecondaryRedFilter*/
    @IBAction func onSecondaryRedFilter(_ sender: UIButton) {
        let images = imageView.image
        let myRGBA = RGBAImage(image: images!)
        let PhotoFilter = Photo()
        let ColorDictionary = PhotoFilter.ReadColors(imageParam: images!)
        filteredImage = PhotoFilter.FilterImageContrast(Level: LevelFilter.medium, avgColor: ColorDictionary, myRGBA: myRGBA!)
        
        imageView.image = filteredImage
        compareButton.isEnabled = true
        EditButton.isEnabled = true
        redFlag = 1
    }
    
    /*share*/
    @IBAction func onShare(_ sender: AnyObject) {
            let activityController = UIActivityViewController(activityItems:["Check out my first app", imageView.image!], applicationActivities: nil)
    present(activityController, animated: true, completion: nil)
    }
}

protocol FilterType {
    func FilterImageContrast(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage
    func FilterImageBright(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage
    func FilterImageDark(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage
    func FilterImageTemperatureHot(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage
    func FilterImageTemperatureCold(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage
}

class Filters:FilterType {
    
    func FilterImageBright(Level: LevelFilter, avgColor: Dictionary<String, Int>,  myRGBA: RGBAImage) -> UIImage {
        let avgRed = avgColor["Red"]
        let avgBlue = avgColor["Blue"]
        let avgGreen = avgColor["Green"]
        var myRGBA = myRGBA
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                var BlueDiff = Int(pixel.blue) - avgBlue!
                var RedDiff = Int(pixel.red) - avgRed!
                var GreenDiff = Int(pixel.green) - avgGreen!
                
                if(RedDiff>0 && GreenDiff>0 && BlueDiff>0)
                {
                    switch Level.rawValue{
                    case "high":
                        RedDiff = RedDiff+15
                        GreenDiff = GreenDiff+15
                        BlueDiff = BlueDiff+15
                    case "medium":
                        RedDiff = RedDiff+12
                        GreenDiff = GreenDiff+12
                        BlueDiff = BlueDiff+12
                    case "low":
                        RedDiff = RedDiff+7
                        GreenDiff = GreenDiff+7
                        BlueDiff = BlueDiff+7
                    default:
                        RedDiff = RedDiff+12
                        GreenDiff = GreenDiff+12
                        BlueDiff = BlueDiff+12
                    }
                    
                    pixel.red = UInt8( max(0,min(255,avgRed! + RedDiff)))
                    pixel.blue = UInt8( max(0,min(255,avgBlue! + BlueDiff)))
                    pixel.green = UInt8( max(0,min(255,avgGreen! + GreenDiff)))
                    myRGBA.pixels[index] = pixel
                    
                }
            }
        }
        return (myRGBA.toUIImage())!
    }
    
    func FilterImageDark(Level: LevelFilter, avgColor: Dictionary<String, Int>, myRGBA: RGBAImage) -> UIImage {
        let avgRed = avgColor["Red"]
        let avgBlue = avgColor["Blue"]
        let avgGreen = avgColor["Green"]
        var myRGBA = myRGBA
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                var BlueDiff = Int(pixel.blue) - avgBlue!
                var RedDiff = Int(pixel.red) - avgRed!
                var GreenDiff = Int(pixel.green) - avgGreen!
                
                if(RedDiff>0 && GreenDiff>0 && BlueDiff>0)
                {
                    switch Level.rawValue{
                    case "high":
                        RedDiff = RedDiff-15
                        GreenDiff = GreenDiff-15
                        BlueDiff = BlueDiff-15
                    case "medium":
                        RedDiff = RedDiff-12
                        GreenDiff = GreenDiff-12
                        BlueDiff = BlueDiff-12
                    case "low":
                        RedDiff = RedDiff-7
                        GreenDiff = GreenDiff-7
                        BlueDiff = BlueDiff-7
                    default:
                        RedDiff = RedDiff-12
                        GreenDiff = GreenDiff-12
                        BlueDiff = BlueDiff-12
                    }
                    
                    pixel.red = UInt8( max(0,min(255,avgRed! + RedDiff)))
                    pixel.blue = UInt8( max(0,min(255,avgBlue! + BlueDiff)))
                    pixel.green = UInt8( max(0,min(255,avgGreen! + GreenDiff)))
                    myRGBA.pixels[index] = pixel
                    
                }
            }
        }
        return (myRGBA.toUIImage())!
    }
    
    func FilterImageTemperatureHot(Level: LevelFilter, avgColor: Dictionary<String, Int>, myRGBA: RGBAImage) -> UIImage {
        
        let avgRed = avgColor["Red"]
        let avgGreen = avgColor["Green"]
        var myRGBA = myRGBA
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var RedDiff = Int(pixel.red) - avgRed!
                var GreenDiff = Int(pixel.green) - avgGreen!
                
                if(RedDiff>0 && GreenDiff>0)
                {
                    switch Level.rawValue{
                    case "high":
                        RedDiff = RedDiff+20
                        GreenDiff = GreenDiff+20
                    case "medium":
                        RedDiff = RedDiff+15
                        GreenDiff = GreenDiff+15
                    case "low":
                        RedDiff = RedDiff+10
                        GreenDiff = GreenDiff+10
                    default:
                        RedDiff = RedDiff+10
                        GreenDiff = GreenDiff+10
                    }
                    
                    pixel.red = UInt8( max(0,min(255,avgRed! + RedDiff)))
                    pixel.green = UInt8( max(0,min(255,avgGreen! + GreenDiff)))
                    myRGBA.pixels[index] = pixel
                    
                }
            }
        }
        return (myRGBA.toUIImage())!
    }
    
    func FilterImageTemperatureCold(Level: LevelFilter, avgColor: Dictionary<String, Int>, myRGBA: RGBAImage) -> UIImage {
        
        var myRGBA = myRGBA
        let avgRed = avgColor["Red"]
        let avgBlue = avgColor["Blue"]
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                
                var RedDiff = Int(pixel.red) - avgRed!
                var BlueDiff = Int(pixel.blue) - avgBlue!
                
                if(RedDiff>0 && BlueDiff>0)
                {
                    switch Level.rawValue{
                    case "high":
                        RedDiff = RedDiff+20
                        BlueDiff = BlueDiff+30
                    case "medium":
                        RedDiff = RedDiff+10
                        BlueDiff = BlueDiff+20
                    case "low":
                        RedDiff = RedDiff+5
                        BlueDiff = BlueDiff+10
                    default:
                        RedDiff = RedDiff+5
                        BlueDiff = BlueDiff+10
                    }
                    
                    pixel.red = UInt8( max(0,min(255,avgRed! + RedDiff)))
                    pixel.blue = UInt8( max(0,min(255,avgBlue! + BlueDiff)))
                    myRGBA.pixels[index] = pixel
                    
                }
            }
        }
        return (myRGBA.toUIImage())!
    }
    
    
    func FilterImageContrast(Level: LevelFilter, avgColor: Dictionary<String,Int>, myRGBA: RGBAImage) -> UIImage {
        
        let avgRed = avgColor["Red"]
        var myRGBA = myRGBA
        
        for y in 0..<myRGBA.height{
            for x in 0..<myRGBA.width{
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                var redDiff = Int(pixel.red) - avgRed!
                
                if(redDiff>0)
                {
                    switch Level.rawValue{
                    
                    case "high":
                        redDiff = redDiff+30
                    case "medium":
                        redDiff = redDiff+20
                    case "low":
                        redDiff = redDiff+10
                    default:
                        redDiff = redDiff+10
                    }
                    pixel.red = UInt8( max(0,min(255,avgRed! + redDiff)))
                    myRGBA.pixels[index] = pixel
                }
            }
        }
        return (myRGBA.toUIImage())!
    }
}



class Photo:Filters{
    
    let images = UIImage(named: "sample")
    
    override init(){
        super.init()
        _ = self.ReadColors(imageParam: images!)
    }
    
    func ReadColors(imageParam: UIImage) -> Dictionary<String,Int>{
        var myRGBA = RGBAImage(image: images!)
        var ColorDictionary:[String:Int] = [:]
        var totalRed = 0, totalGreen = 0, totalBlue = 0, avgRed = 0, avgBlue = 0, avgGreen = 0, count = 0
        
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y * myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                totalRed += Int(pixel.red)
                totalBlue += Int(pixel.blue)
                totalGreen += Int(pixel.green)
            }
        }
        
        count = myRGBA!.width * myRGBA!.height
        avgRed = totalBlue/count
        avgBlue = totalGreen/count
        avgGreen = totalGreen/count
        
        ColorDictionary.updateValue(avgRed, forKey: "Red")
        ColorDictionary.updateValue(avgBlue, forKey: "Blue")
        ColorDictionary.updateValue(avgGreen, forKey: "Green")
        
        return ColorDictionary
    }
}

enum LevelFilter : String{
    case low
    case medium
    case high
}

