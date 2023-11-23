//
//  CaseRepository.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation

class Api {
  static let base = "https://api.api-ninjas.com/v1/covid19?country=mexico"
}

protocol NetworkAPIProtocol {
    func getCaseList() async -> CaseResponse?
}

class CaseRepository: NetworkAPIProtocol{
    let nService: NetworkAPIService
    static let shared = CaseRepository()
    
    init(nService: NetworkAPIService = NetworkAPIService.shared) {
      self.nService = nService
    }
    
    func getCaseList() async -> CaseResponse? {
        return await nService.getCases(url: URL(string: "\(Api.base)")!)
    }
}
