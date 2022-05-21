//
//  DefenseAnnouncementsViewController.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import UIKit
import Alamofire

class DefenseAnnouncementsViewController: UITableViewController {
    
    var announcements: [DefensAnnouncement] = []
    
    private var spinnerView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofireGetRequest()
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        announcements.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let announcement = announcements[indexPath.row]

        content.text = announcement.fullName
        content.secondaryText = "\(announcement.academicDegree ?? ""). Дата защиты: \(announcement.protectionDate ?? "-")"
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


extension DefenseAnnouncementsViewController {
    func alamofireGetRequest() {
        NetworkManager.shared.fetchDataRequest(url: NetworkManager.shared.link) { result in
            switch result {
            case .success(let requests):
                self.announcements = requests
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

