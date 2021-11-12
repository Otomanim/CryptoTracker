//
//  Constants.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 04/11/21.
//

import Foundation

struct Constants{
    static let apiKey = "E20B88D5-204A-4656-886D-D47CFE59CC49"
    static let assetsBaseURL = "https://rest.coinapi.io/v1/assets"
    static let size = 50
    static let assetsIconsUrl = "\(Constants.assetsBaseURL)/icons/\(Constants.size)"
}
