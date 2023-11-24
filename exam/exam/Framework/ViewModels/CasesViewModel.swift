//
//  CasesViewModel.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation
import Combine

class CasesViewModel: ObservableObject{
    @Published var caseList = [Case]()

    private var casesRequirement: CasesRequirementProtocol

    init(casesRequirement: CasesRequirementProtocol = CaseRequirement.shared) {
        self.casesRequirement = casesRequirement
    }
    
    @MainActor
    func fetchCases() async {
        caseList = await casesRequirement.getCases() ?? []
    }
}
