//
//  RMService.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import Foundation
/// Primary API service object
final class RMService {
    // shared instance
    static let shared = RMService()
    
    private init(){}
    
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
        
    }
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///     ype: what we epxect to get back
    ///   - completion: Callback with Data
    public func execute<T: Codable>(_ request:RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<String,Error>)-> Void){
        guard let urlRequest = self.request(from: request)else{
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in 
            guard let data = data, error == nil else {
            completion(.failure(error ?? RMServiceError.failedToGetData))
            return
        }
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
            }
            catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else{
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
