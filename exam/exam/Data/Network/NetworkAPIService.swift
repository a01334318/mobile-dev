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
    
    
    func getCases(url: URL) async -> CaseResponse? {
            var request = URLRequest(url: url)
            request.headers.add(.authorization(bearerToken: apiKey))
            let taskRequest = AF.request(request).validate()
            let response = await taskRequest.serializingData().response
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    return try decoder.decode(CaseResponse.self, from: data)

                } catch {
                    debugPrint("Decoding Error: \(error)")
                    return nil
                }
            case .failure(let error):
                debugPrint("API Request Error: \(error.localizedDescription)")
                return nil
            }
        }
}
