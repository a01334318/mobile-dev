//
//  CaseRepository.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation

class Api {
  static let base = "https://api.api-ninjas.com/v1/covid19?date=2022-01-01"
}

protocol NetworkAPIProtocol {
    func getCaseList() async -> [Case]?
}

class CaseRepository: NetworkAPIProtocol{
    let nService: NetworkAPIService
    static let shared = CaseRepository()
    
    init(nService: NetworkAPIService = NetworkAPIService.shared) {
      self.nService = nService
    }
    
    func getCaseList() async -> [Case]? {
        return await nService.getCaseList() ?? []
    }
}
