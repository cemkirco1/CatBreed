//
//  APIManager.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//

import Foundation
import Alamofire

class APIManager {

    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "x-api-key": "\(Constants.API.apiKey)"
        ]

        return headers
    }
}
