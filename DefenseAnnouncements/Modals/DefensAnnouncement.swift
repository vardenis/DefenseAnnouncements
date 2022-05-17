//
//  DefensAnnouncement.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import Foundation

struct DefensAnnouncement: Decodable {
    
    let code_academic_degree_council: String?
    let academic_degree: String?
    let specialization: String?
    let full_name: String?
    let dissertation_title: String?
    let publication_date: String?
    let protection_date: String?
    let website_url: String?
}

