//
//  AppServiceClient.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//

import Foundation
import Alamofire

class AppServiceClient {
    
    static let shared = AppServiceClient()
    
    private init () {}
    
    func getBreedsList(completionHandler: @escaping (_ breedsResponse: [BreedsResponse]?, _ error: Error?) -> Void)  {
        let serviceURL = Services.getBreedsList
        AF.request(serviceURL, method: .get,
                   parameters: nil,
                   encoding: URLEncoding(destination: .queryString), headers: APIManager.headers()).response { (response) in
            if let data = response.data {
                do {
                    let breeds = try JSONDecoder.init().decode([BreedsResponse].self, from: data)
                    completionHandler(breeds, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
    
    func getBreedsListWithSearch(searchText : String?,_ completionHandler: @escaping (_ breedsResponse: [BreedsResponse]?, _ error: Error?) -> Void)  {
        let serviceURL = Services.getBreedsListWithSearch
        
        let parameters : Parameters = ["q": "\(searchText ?? "")"]
        
        AF.request(serviceURL, method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString), headers: APIManager.headers()).response { (response) in
            if let data = response.data {
                do {
                    let breed = try JSONDecoder.init().decode([BreedsResponse].self, from: data)
                    completionHandler(breed, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }
    }
}
