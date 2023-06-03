//
//  PaginationInfo.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

struct PaginationInfo {
    let count: Int
    let numberOfPages: Int
    let nextPageNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case count
        case numberOfPages = "pages"
        case nextUrl = "next"
    }
}

extension PaginationInfo: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        count = try container.decode(Int.self, forKey: .count)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        
        if
            let nextPageUrl = try? container.decode(URL.self, forKey: .nextUrl),
            let nextPageNumberString = nextPageUrl.valueOf(queryParameter: "page"),
            let nextPageNumber = Int(nextPageNumberString)
        {
            self.nextPageNumber = nextPageNumber
        } else {
            self.nextPageNumber = nil
        }
    }
}
