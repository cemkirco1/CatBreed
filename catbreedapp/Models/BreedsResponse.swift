//
//  BreedsResponse.swift
//  catbreedapp
//
//  Created by cem on 4.05.2022.
//
import Foundation

// MARK: - BreedsResponse
struct BreedsResponse: Codable {
    var adaptability, affectionLevel: Int?
    var altNames: String?
    var cfa_url: String?
    var childFriendly: Int?
    var countryCode, countryCodes, description: String?
    var dogFriendly, energyLevel, experimental, grooming: Int?
    var hairless, healthIssues, hypoallergenic: Int?
    var id: String?
    var image: Image?
    var indoor, intelligence, lap: Int?
    var life_span, name: String?
    var natural: Int?
    var origin: String?
    var rare: Int?
    var referenceImageID: String?
    var rex, sheddingLevel, shortLegs, socialNeeds: Int?
    var strangerFriendly, suppressedTail: Int?
    var temperament: String?
    var vcahospitals_url: String?
    var vetstreet_url: String?
    var vocalisation: Int?
    var weight: Weight?
    var wikipedia_url: String?
    var bidability, catFriendly: Int?
}

// MARK: - Image
struct Image: Codable {
    var height: Int?
    var id: String?
    var url: String?
    var width: Int?
}

// MARK: - Weight
struct Weight: Codable {
    var imperial, metric: String?
}
