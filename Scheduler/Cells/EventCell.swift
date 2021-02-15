//
//  EventCell.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import UIKit

// MARK: - EventCell
class EventCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var startTimeLable: UILabel!
    @IBOutlet weak var conflictView: UIView!
    @IBOutlet weak var endTimeLabel: UILabel!
    public var eventModel: Event? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let model = eventModel else {
            return
        }
        titleLabel.text = model.title
        conflictView.isHidden = !model.isItersectingEvent
        profileLabel.text = model.eventProfileString
        startTimeLable.text = "\(model.startTimeString)"
        endTimeLabel.text =  "\(model.endTimeString)"
        configureAccessibility()
    }
    
}

// MARK: - Helper UI Methods
extension EventCell {
    func configureUI() {
        titleLabel.textColor = SchedulerColors.titleColor
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        profileLabel.textColor = SchedulerColors.bodyColor
        conflictView.backgroundColor = SchedulerColors.conflictColor
        endTimeLabel.textColor = SchedulerColors.bodyColor
        startTimeLable.textColor = SchedulerColors.bodyColor
        conflictView.layer.cornerRadius = self.conflictView.frame.height/2
        profileLabel.layer.cornerRadius = self.profileLabel.frame.height/2
        profileLabel.backgroundColor = SchedulerColors.primaryColor
        profileLabel.textColor = .white
        profileLabel.font = .boldSystemFont(ofSize: 24)
        conflictView.clipsToBounds = true
        profileLabel.clipsToBounds = true
    }
}

// MARK: - ADA Methods
extension EventCell {
    // This function demonstarate the small example of ADA compliance. There is lot more can be done like hints, traits, dynamic size.
    func configureAccessibility() {
        profileLabel.accessibilityLabel = profileLabel.text
        let titleAccessibilityText = conflictView.isHidden ? titleLabel.text : "\(titleLabel.text ?? "") has conflict with other event"
        titleLabel.accessibilityLabel = titleAccessibilityText
        startTimeLable.accessibilityLabel = startTimeLable.text
        endTimeLabel.accessibilityLabel = endTimeLabel.text
    }
}
