//
//  Case.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation

struct Numbers: Codable {
    let total: Int
    let new: Int
}

struct Case: Codable {
    let country: String
    let region: String
    let cases: Numbers
}

struct Response: Codable {
    let results: [Case]
}
