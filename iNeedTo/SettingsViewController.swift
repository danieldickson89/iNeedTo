//
//  SettingsViewController.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 4/2/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let savedLeftImage = NSUserDefaults.standardUserDefaults().objectForKey("leftImageName") as? String
    let savedCenterImage = NSUserDefaults.standardUserDefaults().objectForKey("centerImageName") as? String
    let savedRightImage = NSUserDefaults.standardUserDefaults().objectForKey("rightImageName") as? String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        
        if let left = savedLeftImage, center = savedCenterImage, right = savedRightImage {
            
            pickerView.selectRow(Icons.iconNames.indexOf(left)!, inComponent: 0, animated: false)
            pickerView.selectRow(Icons.iconNames.indexOf(center)!, inComponent: 1, animated: false)
            pickerView.selectRow(Icons.iconNames.indexOf(right)!, inComponent: 2, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Icons.icons.count
    }
    
    // MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        
        var myImageView = UIImageView()
        
        switch row {
        case 0:
            myImageView = UIImageView(image: UIImage(named: "airplane"))
        case 1:
            myImageView = UIImageView(image: UIImage(named:"beach"))
        case 2:
            myImageView = UIImageView(image: UIImage(named:"bike"))
        case 3:
            myImageView = UIImageView(image: UIImage(named:"hiking"))
        case 4:
            myImageView = UIImageView(image: UIImage(named:"ironman"))
        case 5:
            myImageView = UIImageView(image: UIImage(named:"moneybag"))
        case 6:
            myImageView = UIImageView(image: UIImage(named:"moneybills"))
        case 7:
            myImageView = UIImageView(image: UIImage(named:"ninjaturtle"))
        case 8:
            myImageView = UIImageView(image: UIImage(named:"running"))
        case 9:
            myImageView = UIImageView(image: UIImage(named:"shoppingcart"))
        case 10:
            myImageView = UIImageView(image: UIImage(named:"workingout"))
        default:
            myImageView.image = nil
            
            return myImageView
        }
        return myImageView
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //Icons.leftTabIcon = Icons.icons[self.pickerView.selectedRowInComponent(0)]
        Icons.leftImageName = Icons.iconNames[self.pickerView.selectedRowInComponent(0)]
        NSUserDefaults.standardUserDefaults().setObject(Icons.leftImageName, forKey: "leftImageName")
        
        //Icons.centerTabIcon = Icons.icons[self.pickerView.selectedRowInComponent(1)]
        Icons.centerImageName = Icons.iconNames[self.pickerView.selectedRowInComponent(1)]
        NSUserDefaults.standardUserDefaults().setObject(Icons.centerImageName, forKey: "centerImageName")
        
        //Icons.rightTabIcon = Icons.icons[self.pickerView.selectedRowInComponent(2)]
        Icons.rightImageName = Icons.iconNames[self.pickerView.selectedRowInComponent(2)]
        NSUserDefaults.standardUserDefaults().setObject(Icons.rightImageName, forKey: "rightImageName")
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destinationTabBarController = segue.destinationViewController as? UITabBarController {
            
            if let leftImage = self.savedLeftImage, centerImage = self.savedCenterImage, rightImage = self.savedRightImage {
                let vc1 = destinationTabBarController.viewControllers![0] as? HomeRemindersTableViewController
                vc1?.tabBarItem.image = UIImage(named: leftImage)
                
                let vc2 = destinationTabBarController.viewControllers![1] as? WorkRemindersTableViewController
                vc2?.tabBarItem.image = UIImage(named: centerImage)
                
                let vc3 = destinationTabBarController.viewControllers![2] as? SchoolRemindersTableViewController
                vc3?.tabBarItem.image = UIImage(named: rightImage)
            }
        }
    }
}
