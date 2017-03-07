//
//  ElementManager.swift
//  Elemental
//
//  Created by Trip Creighton on 2/27/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

/// Manager class for all elements:
class ElementManager {
    static let shared = ElementManager()
    var elementList = [Element]()
    
    private init() {
        let path = Bundle.main.path(forResource: "Elements", ofType:"plist")!
        let rawArray = NSArray(contentsOfFile: path)!
        
        for element in rawArray {
            elementList.append(Element(dict: element as! NSDictionary))
        }
        
        elementList.sort(by: {$0.atomicNumber < $1.atomicNumber})
    }
    
    func getElement(byName: String) -> Element? {
        for element in elementList {
            if element.elementName!.contains(byName) || element.elementName! == (byName) {
                return element
            }
        }
        return nil
    }
    
    func getElement(byAtomicNumber: Int) -> Element {
        return elementList[byAtomicNumber]
    }
    
}

/// Single element:
class Element {
    var elementName: String? = nil,
        elementSymbol: String? = nil,
        elementState: String? = nil,
        discoveryYear: String? = nil,
        atomicWeight: String? = nil,
        imageDir: String? = nil,
        image: UIImage? = nil,
        flippedImage: UIImage? = nil,
        largeImage: UIImage? = nil
    
    var atomicNumber: Int = -1,
        elementPeriod: Int = -1,
        vertPos: Int = -1,
        backgroundColor: UIColor? = nil
    
    init(dict: NSDictionary) {
        elementName = dict.value(forKey: "name") as? String
        elementSymbol = dict.value(forKey: "symbol") as? String
        elementState = dict.value(forKey: "state") as? String
        atomicWeight = dict.value(forKey: "atomicWeight") as? String
        atomicNumber = dict.value(forKey: "atomicNumber") as! Int
        image = UIImage(named: Bundle.main.path(forResource: "small_images/element\(atomicNumber)", ofType: "png")!)
        flippedImage = UIImage(named: Bundle.main.path(forResource: "flipped_images/flippedElement\(atomicNumber)", ofType: "png")!)
        largeImage = UIImage(named: Bundle.main.path(forResource: "large_images/largeElement\(atomicNumber)", ofType: "png")!)
        
        // Determine color by which state the item is:
        switch elementState! {
        case "Solid":
            backgroundColor = .red
        case "Artificial":
            backgroundColor = .gray
        case "Gas":
            backgroundColor = .purple
        case "Liquid":
            backgroundColor = .gray
        default:
            break
        }
    }
}
