
//
//  ElementViewVC.swift
//  Elemental
//
//  Created by Trip Creighton on 3/6/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class ElementViewVC: UIViewController {
    
    var element:Element? = nil
    
    fileprivate var imgView:UIImageView! = UIImageView(),
                    flippedImageView:UIImageView! = UIImageView()
    
    fileprivate var isFlipped:Bool = false {
        didSet {
            if isFlipped {
                UIView.transition(from: imgView, to: flippedImageView, duration: 1.0, options: .transitionFlipFromRight, completion: nil)
                flippedImageView.isHidden = false
            } else {
                UIView.transition(from: flippedImageView, to: imgView, duration: 1.0, options: .transitionFlipFromRight, completion: nil)
                isFlipped = false
                flippedImageView.isHidden = true
            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Main image view::
        imgView.frame = CGRect(x: view.center.x - 120, y: view.center.y - 120, width: 240, height: 240)
        imgView.image = element?.largeImage
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipFrontGestureTapped)))
        imgView.isUserInteractionEnabled = true
        
        // Flipped image view:
        flippedImageView.frame = imgView.frame
        flippedImageView.image = element?.flippedImage
        flippedImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flipBackGestureTapped)))
        flippedImageView.isUserInteractionEnabled = true
        flippedImageView.isHidden = true
        
        view.backgroundColor = .clear
        view.addSubview(flippedImageView)
        view.addSubview(imgView)
    }
    
    // Flips from front to back:
    func flipFrontGestureTapped(tap: UITapGestureRecognizer) {
        isFlipped = true
    }
    
    // Flips from back to front:
    func flipBackGestureTapped(tap: UITapGestureRecognizer) {
        isFlipped = false
    }
}
