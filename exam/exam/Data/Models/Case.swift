//
//  Case.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation

struct Case: Decodable, Identifiable {
    let id: Int
    let country: String?
    let region: String?
    let cases: [DataPoint]
}

struct DataPoint: Decodable {
    let point: String?
    let data: [Data]
}

struct Data: Decodable {
    let total: Int
    let new: Int
}

struct CaseResponse: Decodable {
    let results: [Case]
}
