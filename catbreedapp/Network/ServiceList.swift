//
//  ServiceList.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import Foundation

struct Services {
    static let getBreedsList = "\(Constants.API.baseURL)/breeds"
    static let getBreedsListWithSearch = "\(Constants.API.baseURL)/breeds/search"
}
