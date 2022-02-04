//
//  ReminderDetailViewControllerTableViewController.swift
//  Today
//
//  Created by Deforeturn on 2/4/22.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    private var reminder:Reminder?
    private var detailViewDataSource: ReminderDetailViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let reminder = reminder else {
            fatalError("No reminder found for detail view")
        }
        detailViewDataSource = ReminderDetailViewDataSource(reminder: reminder)
        tableView.dataSource = detailViewDataSource
    }
    
    func configure(with reminder:Reminder){
        self.reminder = reminder
    }
}
extension ReminderDetailViewController{

}
