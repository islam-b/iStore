//
//  BaseService.swift
//  iStore
//
//  Created by Mohamed Islam BOUAYACHE on 8/8/2023.
//

import Foundation


class BaseService {
    
    let baseUrl = "https://c2b211eb-6cdf-4cfa-8f89-2a85b3a1caa6.mock.pstmn.io/istore"

    
    func performRequest<T:Decodable>(_ request: URLRequest, handleData: ((T)->Void)?, handleError: ((Error)->Void)?) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
                if let safeData = data {
                    let parsed : T? = self._parseJson(safeData)
                    if let safeParsed = parsed {
                        if (handleData != nil) {
                            handleData!(safeParsed)
                        }
                    } else {
                        if (handleError != nil) {
                            handleError!(Error(title: "Error", message: "An error has occured"))
                        }
                    }
                } else {
                    if (handleError != nil) {
                        handleError!(Error(title: "Error", message: "An error has occured"))
                    }
                }
            }
        task.resume()
    }
    
    
    private func _parseJson<T: Decodable>(_ data: Data) -> T?  {
        do {
            let decoder = JSONDecoder()
            let output = try decoder.decode(T.self, from: data)
            return output
        } catch {
            return nil
        }
    }
    
}

protocol BaseServiceDelegate {
    func handleError(_ error: Error) ->Void
}
