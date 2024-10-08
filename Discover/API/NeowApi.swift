//
//  NeowApi.swift
//  StarryNight
//
//  Created by Pelangi Masita Wati on 05/10/24.
//

import Foundation

class NeowAPICaller {
    static let shared = NeowAPICaller()
    private let apiKey = "Xh7duhMXbKtTMDVV8vicbLBVCELWKZfsY0vCstGr"
    private let baseURL = "https://api.nasa.gov/neo/rest/v1/feed"

    func fetchAsteroids(startDate: String, endDate: String, completion: @escaping (Result<WelcomeNeow, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: baseURL) else { return }

        urlComponents.queryItems = [
            URLQueryItem(name: "start_date", value: startDate),
            URLQueryItem(name: "end_date", value: endDate),
            URLQueryItem(name: "api_key", value: apiKey)
        ]

        guard let url = urlComponents.url else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let welcome = try JSONDecoder().decode(WelcomeNeow.self, from: data)
                completion(.success(welcome))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
