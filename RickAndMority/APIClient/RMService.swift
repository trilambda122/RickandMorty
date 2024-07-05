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
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with Data
    public func execute(_ request:RMRequest, completion: @escaping ()-> Void){
        
    }
}
