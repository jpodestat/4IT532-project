//
//  PaginatedResponse.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

struct PaginatedResponse<T: Decodable> {
    let info: PaginationInfo
    let results: [T]
}

extension PaginatedResponse: Decodable {}
