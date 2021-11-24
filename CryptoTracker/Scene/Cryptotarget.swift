//
//  Cryptotarget.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 16/11/21.
//

import Foundation
import Moya

enum CryptoTarget: TargetType {
    case loadCryptos
    case loadImages
    
    var baseURL: URL {
        switch self {
        case .loadCryptos:
            return Constants.baseURL
        case .loadImages:
            return Constants.baseIconsURL
        }
    }
    
    var path: String {
        ""
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestParameters(parameters: ["apiKey": Constants.apiKey], encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]?{
        Constants.Headers.contentTypeApplicationJSON
    }
    
    var validationType: ValidationType {
        .successCodes
        
    }
    
}

//extension CryptoTarget: AccessTokenAuthorizable {
//    var authorizationType: AuthorizationType? {
//        return .bearer
//    }
//    
//    static var authPlugin: AccessTokenPlugin {
//        return AccessTokenPlugin { target in
////            return "test-api-auth"
//            guard let cryptoTarget = target as? CryptoTarget else {return ""}
//            switch cryptoTarget {
//            case .loadCryptos:
//                return "custom-value"
//            case .loadImages:
//                return ""
//            }
//            
//        }
//    }
//    static var availablePlugins: [PluginType] {
//        [authPlugin]
//    }
//    
//}
