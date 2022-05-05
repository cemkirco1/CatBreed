//
//  DetailVM.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import Foundation

protocol DetailVMDelegate : AnyObject{
    func didGetBreed(breed: BreedsResponse?)
}

class DetailVM {
    weak var delegate : DetailVMDelegate?
    
    var response : BreedsResponse?
    
    init(breed: BreedsResponse?) {
        self.response = breed
    }
    
    
    func getResponse() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.delegate?.didGetBreed(breed: self.response)
        }
    }
}
