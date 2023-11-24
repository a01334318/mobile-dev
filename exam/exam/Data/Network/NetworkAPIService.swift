//
//  NetworkAPIService.swift
//  exam
//
//  Created by Erik Cabrera on 23/11/23.
//

import Foundation
import Alamofire

class NetworkAPIService{
    static let shared = NetworkAPIService()
    // Api key propia
    let apiKey = "9HW9PlLKXNpnkhBWY2tWSw==2HrZQ3kXsDz9ynxJ"
    
    
    func getCaseList() async -> [Case]? {
        let url = "\(Api.base)"

        let headers: HTTPHeaders = [
            "X-Api-Key" : "9HW9PlLKXNpnkhBWY2tWSw==2HrZQ3kXsDz9ynxJ",
        ]

        do {
            let taskRequest = AF.request(url, method: .get, headers: headers).validate()
            let response = await taskRequest.serializingData().response
            
            switch response.result {
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode([Case].self, from: data)
                    debugPrint(countries)
                    return countries
                } catch {
                    debugPrint(error.localizedDescription)
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
        }
    }
}
