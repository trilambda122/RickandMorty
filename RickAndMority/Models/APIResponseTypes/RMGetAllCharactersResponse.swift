//
//  GetAllCharactersResponse.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int?
        let next: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}


