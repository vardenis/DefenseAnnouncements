//
//  DefenseAnnouncementsViewController.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import UIKit

class DefenseAnnouncementsViewController: UITableViewController {
    
    var announcements: [DefensAnnouncement] = []
    private var spinnerView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinnerView = showSpinner(in: tableView)
        requestReturn()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        announcements.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let announcement = announcements[indexPath.row]

        content.text = announcement.full_name
        content.secondaryText = "\(announcement.academic_degree ?? ""). Дата защиты: \(announcement.protection_date ?? "-")"
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func requestReturn() {
        NetworkManager.shared.fetchRequest { request, announcements in
            DispatchQueue.main.async {
                self.spinnerView?.stopAnimating()
                self.announcements = announcements
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.reloadData()
            }
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }

}
