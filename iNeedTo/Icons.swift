//
//  Icons.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 4/2/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import Foundation
import UIKit

class Icons {
    
    static let sharedController = Icons()
    
    static var icons: [UIImage] {
        let airplane = UIImage(named:"airplane")
        let beach = UIImage(named:"beach")
        let bike = UIImage(named:"bike")
        let hiking = UIImage(named:"hiking")
        let ironman = UIImage(named:"ironman")
        let moneybag = UIImage(named:"moneybag")
        let moneybills = UIImage(named:"moneybills")
        let ninjaturtle = UIImage(named:"ninjaturtle")
        let running = UIImage(named:"running")
        let shoppingcart = UIImage(named:"shoppingcart")
        let workingout = UIImage(named:"workingout")
        
        return [airplane!, beach!, bike!, hiking!, ironman!, moneybag!, moneybills!, ninjaturtle!, running!, shoppingcart!, workingout!]
    }
    
    static var iconNames: [String] {
        let airplane = "airplane"
        let beach = "beach"
        let bike = "bike"
        let hiking = "hiking"
        let ironman = "ironman"
        let moneybag = "moneybag"
        let moneybills = "moneybills"
        let ninjaturtle = "ninjaturtle"
        let running = "running"
        let shoppingcart = "shoppingcart"
        let workingout = "working out"
        
        return [airplane, beach, bike, hiking, ironman, moneybag, moneybills, ninjaturtle, running, shoppingcart, workingout]
    }
    
    static var leftTabIcon: UIImage?
    static var centerTabIcon: UIImage?
    static var rightTabIcon: UIImage?
    
    static var leftImageName: String?
    static var centerImageName: String?
    static var rightImageName: String?
    
}