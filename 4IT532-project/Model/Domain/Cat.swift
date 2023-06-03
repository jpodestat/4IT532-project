//
//  Cat.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

struct Cat {
    init(id: String, wikipediaUrl: URL? = nil, description: String, name: String, origin: String, lifeSpan: String, temperament: String, indoor: Int, imageUrl: URL) {
        self.id = id
        self.wikipediaUrl = wikipediaUrl
        self.description = description
        self.name = name
        self.origin = origin
        self.lifeSpan = lifeSpan
        self.temperament = temperament
        self.indoor = indoor
        self.imageUrl = imageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case wikipediaUrl = "wikipedia_url"
        case image
        case description
        
        case name
        case origin
        case lifeSpan = "life_span"
        case temperament
        case indoor
    }
    // mandatory data
    let id: String
    let wikipediaUrl: URL?
    let description: String
    
    // five optional metadata
    let name: String
    let origin: String
    let lifeSpan: String
    let temperament: String
    let indoor: Int
    
    var imageUrl: URL
}


extension Cat: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        wikipediaUrl = try? container.decode(URL.self, forKey: .wikipediaUrl)
        description = try container.decode(String.self, forKey: .description)
        name = try container.decode(String.self, forKey: .name)
        origin = try container.decode(String.self, forKey: .origin)
        lifeSpan = try container.decode(String.self, forKey: .lifeSpan)
        temperament = try container.decode(String.self, forKey: .temperament)
        indoor = try container.decode(Int.self, forKey: .indoor)

        if let catImage = try? container.decode(CatImage?.self, forKey: .image) {
            imageUrl = catImage.url
        } else {
            imageUrl = Constants.catImagePlaceholderUrl
        }
    }
}

extension Cat: Identifiable {}
extension Cat: Equatable {}
