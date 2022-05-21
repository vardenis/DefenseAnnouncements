//
//  NetworkManager.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    let link = "https://isu.ifmo.ru/ords/isurest/v1/api/metric/DEFENSE_ANNOUNCEMENTS/1/79c2ae51e55c21663f3acc6fe66f163bd861a57e4e0a9183b50e067d1021b047"
        
    func fetchDataRequest(url: String, completion: @escaping(Result<[DefensAnnouncement], NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let defensAnnouncement = DefensAnnouncement.getRequest(from: value)
                    DispatchQueue.main.async {
                        completion(.success(defensAnnouncement))
                    }
                    print(defensAnnouncement)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private init() {}

}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
