//
//  CharaterListViewViewModel.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import UIKit

final class CharaterListViewViewModel: NSObject {
    func fetchCharacrers(){
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self ){result in
            switch result {
            case .success(let model):
                print("TOTAL: " + String(model.info.count))
                print("PAGES: " + String(model.info.pages!))
                print("Results: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CharaterListViewViewModel: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
}
