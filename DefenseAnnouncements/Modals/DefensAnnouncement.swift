//
//  DefensAnnouncement.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import Foundation

struct DefensAnnouncement: Decodable {
    
    let codeAcademicDegreeCouncil: String?
    let academicDegree: String?
    let specialization: String?
    let fullName: String?
    let dissertationTitle: String?
    let publicationDate: String?
    let protectionDate: String?
    let websiteUrl: String?
    
    init(defensAnnouncementData: [String: Any]) {
        codeAcademicDegreeCouncil = defensAnnouncementData["code_academic_degree_council"] as? String
        academicDegree = defensAnnouncementData["academic_degree"] as? String
        specialization = defensAnnouncementData["specialization"] as? String
        fullName = defensAnnouncementData["full_name"] as? String
        dissertationTitle = defensAnnouncementData["dissertation_title"] as? String
        publicationDate = defensAnnouncementData["publication_date"] as? String
        protectionDate = defensAnnouncementData["protection_date"] as? String
        websiteUrl = defensAnnouncementData["website_url"] as? String
    }

    static func getRequest(from value: Any) -> [DefensAnnouncement] {
        guard let request = value as? [String: Any] else { return []}
        guard let requestData = request["data"] as? [[String: Any]] else {return []}
        return requestData.compactMap { DefensAnnouncement(defensAnnouncementData: $0) }
    }
}

