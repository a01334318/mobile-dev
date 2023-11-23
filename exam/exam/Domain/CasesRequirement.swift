//
//  CasesRequirement.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation

protocol CasesRequirementProtocol{
    func getCases() async -> CaseResponse?
}

class CaseRequirement: CasesRequirementProtocol {
    let dataRepository: CaseRepository
    static let shared = CaseRequirement()
    
    init (dataRepository: CaseRepository = CaseRepository.shared){
        self.dataRepository = dataRepository
    }
    
    func getCases() async -> CaseResponse? {
        return await dataRepository.getCaseList()
    }
}
