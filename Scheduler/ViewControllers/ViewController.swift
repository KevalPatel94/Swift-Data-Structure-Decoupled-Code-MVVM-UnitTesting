//
//  ScheduleViewController.swift
//  Scheduler
//
//  Created by Keval Patel on 1/18/21.
//

import UIKit
import Foundation

// MARK: - ScheduleViewController
class ScheduleViewController: UIViewController {
    @IBOutlet weak var schedulerTableView: UITableView!
    private var schedulerViewModel = SchedulerViewModel()
    private lazy var events: [[Event]] = {
        return schedulerViewModel.chronologicallySortedEvents
    }()
    private lazy var SchedulerError: SchedulerError? = {
        return schedulerViewModel.SchedulerError
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        schedulerTableView.register(UINib.init(nibName: Constants.eventCell, bundle: nil), forCellReuseIdentifier: Constants.eventCellIdentifier)
        schedulerTableView.dataSource = self
        schedulerTableView.delegate = self
        schedulerTableView.tableFooterView = UIView()
        schedulerTableView.reloadData()
        showErrorAlert(SchedulerError: schedulerViewModel.SchedulerError)
    }
}

// MARK: - TableViewDelegate methods
extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let eventCell = schedulerTableView.dequeueReusableCell(withIdentifier: Constants.eventCellIdentifier) as? EventCell else {
            return UITableViewCell()
        }

        eventCell.eventModel = events[indexPath.section][indexPath.row]
        
        return eventCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionView(headerTitle: events[section].first?.headerTitle)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.tableViewSectionHeight
    }
    
}

// MARK: - Helper UI Methods
extension ScheduleViewController {
    /// sectionView will build lable for section and return prepared header UILabel
    /// - Parameters:
    ///     - headerTitle: String?
    /// - Returns: UILabel
    func sectionView(headerTitle: String?) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .white
        label.textColor = SchedulerColors.titleColor
        label.text = headerTitle
        return label
    }
    
    /// showErrorAlert will construct and display erroe alert based on SchedulerError passed into it.
    /// - Parameters:
    ///     - SchedulerError: SchedulerError?
    func showErrorAlert(SchedulerError: SchedulerError?)  {
        guard let SchedulerError = SchedulerError else { return }
        let alert = UIAlertController(title: SchedulerError.message, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Constants
extension ScheduleViewController {
    struct Constants {
        static let eventCell: String = "EventCell"
        static let eventCellIdentifier: String = "EventCellIdentifier"
        static let tableViewSectionHeight: CGFloat = 30
    }
}


