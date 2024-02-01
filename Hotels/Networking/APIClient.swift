//
//  ApiCaller.swift
//  Hotels
//
//  Created by Lol Kek on 11/01/2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case parseDataError(String)
}

public struct APIClient {

    private static let networkQueue = OperationQueue()
    private static let imageCache = NSCache<NSString, NSData>()
    // MARK: Public

    static func fetch <T: Codable>(urlString: String, 
                                 completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        let request = URLRequest(url: url)

        networkQueue.addOperation {
            URLSession.shared.dataTask(with: request) { data, response, error in
                handleResponse(data: data,
                               response: response,
                               error: error,
                               completion: completion)
            }.resume()
        }
    }

    static func fetchImageData(urlString: String,
                               completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        if let cachedImageData = imageCache.object(forKey: urlString as NSString) {
            completion(.success(cachedImageData as Data))
                 return
             }

        let request = URLRequest(url: url)

        networkQueue.addOperation {
            URLSession.shared.dataTask(with: request) { data, response, error in
                handleResponseData(data: data,
                                   response: response,
                                   error: error,
                                   urlString: urlString,
                                   completion: completion)
            }.resume()
        }
    }

    // MARK: Private

    private static func handleResponse<T: Codable>(data: Data?,
                                                   response: URLResponse?,
                                                   error: Error?,
                                                   completion: @escaping (Result<T, NetworkError>) -> Void) {
        if error != nil {
            completion(.failure(.urlError))
            return
        }

        guard let data = data else {
            completion(.failure(.parseDataError("No data found")))
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedResponse = try decoder.decode(T.self, from: data)
            completion(.success(decodedResponse))
        } catch {
            completion(.failure(.parseDataError("Failed to decode data")))
        }
    }

    private static func handleResponseData(data: Data?,
                                           response: URLResponse?,
                                           error: Error?,
                                           urlString: String,
                                           completion: @escaping (Result<Data, NetworkError>) -> Void) {
     
        if let _ = error {
            completion(.failure(.urlError))
            return
        }

        guard let data = data else {
            completion(.failure(.parseDataError("No data found")))
            return
        }
        
        imageCache.setObject(data as NSData, forKey: urlString as NSString)
        completion(.success(data))
    }
}
