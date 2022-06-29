//
//  NetworkManager.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    // MARK: - Private Properties

    static let shared = NetworkManager()

    private let session = URLSession.shared
    private let decoder = JSONDecoder()

    private enum Path {
        static let activeOrders = "https://www.roxiemobile.ru/careers/test/orders.json"
    }

    // MARK: - Public Methods

    func fetchActiveOrdersData(completion: @escaping (Result<[ActiveOrders], NetworkError>) -> Void) {
        guard let url = URL(string: Path.activeOrders) else {
            completion(.failure(.invalidURL))
            return
        }

        let task = session.dataTask(with: url) { data, _, error in
            guard let parseredData = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decodedData = try self.decoder.decode([ActiveOrders].self, from: parseredData)
                completion(.success(decodedData))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }
}

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
