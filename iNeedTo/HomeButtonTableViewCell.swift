//
//  HomeButtonTableViewCell.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class HomeButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    var delegate: HomeButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func checkBoxButtonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    func updateCheckbox(isComplete: Bool) {
        if isComplete {
            cellButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            cellButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol HomeButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: HomeButtonTableViewCell)
}

extension HomeButtonTableViewCell {
    
    func updateWithReminder(reminder: Reminder) {
        updateCheckbox(reminder.isComplete!.boolValue)
        cellLabel.text = reminder.title
        cellLabel.font = UIFont.boldSystemFontOfSize(18.0)
        if let level = reminder.level {
            switch level {
            case "aHigh": cellButton.tintColor = UIColor.myRedColor()
            case "bMedium": cellButton.tintColor = UIColor.myOrangeColor()
            case "cLow": cellButton.tintColor = UIColor.myYellowColor()
            default: cellButton.tintColor = UIColor.myGrayColor()
            }
        }
        if let category = reminder.category {
            switch category {
            case "home": cellLabel.textColor = UIColor.myBlueColor()
            case "work": cellLabel.textColor = UIColor.myGreenColor()
            case "school": cellLabel.textColor = UIColor.myPurpleColor()
            default: cellLabel.textColor = UIColor.blackColor()
            }
        }
    }
}
