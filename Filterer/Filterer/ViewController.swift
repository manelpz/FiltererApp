//
//  ViewController.swift
//  Filterer
//
//  Created by Emmanuel Lopez Guerrero on 5/9/20.
//  Copyright © 2020 Emmanuel Lopez Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var filteredImage: UIImage?
    
    @IBOutlet var secundaryMenu: UIView!
    
    @IBOutlet var buttonMenu: UIView!
    @IBOutlet var imageView: UIImageView!
    /*filterButton
     photoButton
     compareButton
     shareButton*/
    @IBOutlet var filterButton: UIButton!

    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected){
            hiddenMenu()
            sender.isSelected = false
        }else{
            showSecondaryMenu()
            sender.isSelected = true
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
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
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
    
    func showSecondaryMenu(){
        view.addSubview(secundaryMenu)
        let bottomConstraint = secundaryMenu.bottomAnchor.constraint(equalTo: buttonMenu.topAnchor)
        let leftConstraint = secundaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = secundaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let heightConstraint =  secundaryMenu.heightAnchor.constraint(equalToConstant: 44)
        NSLayoutConstraint.activate([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secundaryMenu.alpha = 0
        
        UIView.animate(withDuration: 0.4){
            self.secundaryMenu.alpha = 1.0
        }
    }
    
    
    
    /*share*/
    
    @IBAction func onShare(_ sender: AnyObject) {
            let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
    present(activityController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secundaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        secundaryMenu.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        /*let image = UIImage(named: "sample")!
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
    
    filteredImage = myRGBA!.toUIImage()
    */
    }
}
