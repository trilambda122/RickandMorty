//
//  RMCharacterViewController.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character,
                                queryParameters: [URLQueryItem(name: "name", value: "rick"),
                                                  URLQueryItem(name: "status", value: "alive")])
        
        print(request.url)
        
        RMService.shared.execute(request,
                                 expecting: RMCharacter.self){ result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
                                
    }

    
}
