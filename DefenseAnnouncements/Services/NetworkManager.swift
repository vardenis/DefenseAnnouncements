//
//  NetworkManager.swift
//  DefenseAnnouncements
//
//  Created by Денис on 17.05.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    let link = "https://isu.ifmo.ru/ords/isurest/v1/api/metric/DEFENSE_ANNOUNCEMENTS/1/79c2ae51e55c21663f3acc6fe66f163bd861a57e4e0a9183b50e067d1021b047"
    
    func fetchRequest(result: @escaping (Request,[DefensAnnouncement]) -> Void) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                print("Ошибка 1")
                return
            }
            
            do {
                let request = try JSONDecoder().decode(Request.self, from: data)
                let announcements = request.data
                result(request,announcements ?? [])
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    
    private init() {}
    
}

