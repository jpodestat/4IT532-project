//
//  HTTPHeader.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

enum HTTPHeader {
    enum HeaderField: String {
        case contentType = "Content-Type"
        case apiKey = "x-api-key"
    }

    enum ContentType: String {
        case json = "application/json"
        case text = "text/html;charset=utf-8"
    }
}
