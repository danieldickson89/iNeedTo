//
//  WorkButtonTableViewCell.swift
//  iNeedTo
//
//  Created by Daniel Dickson on 3/3/16.
//  Copyright © 2016 Daniel Dickson. All rights reserved.
//

import UIKit

class WorkButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    @IBAction func checkBoxButtonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    var delegate: WorkButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func updateCheckbox(isComplete: Bool) {
        if isComplete {
            cellButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            cellButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol WorkButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: WorkButtonTableViewCell)
}

extension WorkButtonTableViewCell {
    
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
