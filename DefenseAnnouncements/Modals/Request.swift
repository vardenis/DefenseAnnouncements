//
//  Request.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import Foundation

struct Request: Decodable {
    let all_rows_count: Int?
    let max_page_size: Int?
    let page: Int?
    let metric_name: String?
    let data: [DefensAnnouncement]?
}


