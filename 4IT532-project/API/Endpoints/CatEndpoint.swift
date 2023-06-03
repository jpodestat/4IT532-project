//
//  CatEndpoint.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

enum CatEndpoint: Endpoint {
    
    case getBreeds(page: Int?)
    
    var path: String {
        switch self {
        case .getBreeds:
            return "breeds"
        }
    }
}
