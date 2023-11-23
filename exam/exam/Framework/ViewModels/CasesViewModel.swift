//
//  CasesViewModel.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation
import Combine

class CasesViewModel: ObservableObject{
    @Published var cases: [Case] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private var casesRequirement: CasesRequirementProtocol

    init(casesRequirement: CasesRequirementProtocol = CaseRequirement.shared) {
        self.casesRequirement = casesRequirement
        fetchCases()
    }
    
    func fetchCases(){
        isLoading = true
        
        Task{
            do {
                if let caseResponse = await casesRequirement.getCases() {
                    self.cases = caseResponse.results
                }
            }
            catch{
                self.error = error
            }
            
            isLoading = false
        }
    }
}
