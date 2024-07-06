//
//  RMRequest.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import Foundation
/// Object for single API call
final class RMRequest{
    
    public init(endpoint: RMEndpoint,
                pathComponents: [String]=[],
                queryParameters: [URLQueryItem]=[])
    {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    // set up some vars etc
    private let endpoint: RMEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    public let httpMethod = "GET"
    // setup the base url
    private struct Constants{
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    // create a url string from the supplied information
    private var urlString: String {
        var string = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty{
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else{return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        return string
    }
    
    // returns a URL object from a supplied url string
    public var url: URL?{
        return URL(string: urlString)
    }


    

}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}





