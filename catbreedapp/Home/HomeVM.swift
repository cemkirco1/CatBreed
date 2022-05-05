//
//  HomeVM.swift
//  catbreedapp
//
//  Created by cem on 5.05.2022.
//

import Foundation

protocol HomeVMDelegate: AnyObject {
    func didGetBreedWithSearchText(breed: [BreedsResponse]?)
    func didGetBreedsList(breeds: [BreedsResponse]?)
}


class HomeVM {
    
    weak var delegate: HomeVMDelegate?

    func getBreedsList() {
        AppServiceClient.shared.getBreedsList { breedsResponse, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }else {
                self.delegate?.didGetBreedsList(breeds: breedsResponse)
            }
        }
    }
    
    
    func getBreedWithSearchText(searchText : String?) {
        AppServiceClient.shared.getBreedsListWithSearch(searchText: searchText) { breedResponse, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }else {
                self.delegate?.didGetBreedWithSearchText(breed: breedResponse)
            }

        }
    }
}
