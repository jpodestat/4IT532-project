//
//  APIError.swift
//  4IT532-project
//
//  Created by Jan Podestát on 01.06.2023.
//

import Foundation

enum APIError: Error {
    case unaceptableStatusCode
    case decodingFailed(error: Error)
    case invalidUrlComponents
}
