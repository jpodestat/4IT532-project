//
//  CatImage.swift
//  4IT532-project
//
//  Created by Jan Podestát on 02.06.2023.
//

import Foundation

struct CatImage: Decodable {
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    let url: URL
}

extension CatImage: Equatable {}
