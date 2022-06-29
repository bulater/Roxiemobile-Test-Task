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
        static let image = "https://www.roxiemobile.ru/careers/test/images/"
    }

    // MARK: - Public Methods

    func fetchActiveOrdersData<T: Codable>(of type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
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
                let decodedData = try self.decoder.decode(T.self, from: parseredData)
                completion(.success(decodedData))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError))
            }
        }

        task.resume()
    }

    func setOrderVehicleImage(from model: ActiveOrdersViewModel?, image: UIImageView?) {
        let imageCahche = ImageCache.shared
        let url = Path.image + (model?.vehicleImage ?? "")
        if let imageFromCache = imageCahche.object(forKey: url as NSString) {
            image?.image = imageFromCache
            return
        }

        DispatchQueue.global().async {
            guard
                let imageUrl = URL(string: url),
                let imageData = try? Data(contentsOf: imageUrl)
            else {
                return
            }

            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: imageData) else { return }
                image?.image = imageToCache

                imageCahche.setObject(imageToCache, forKey: url as NSString)
            }
        }
    }
}

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
