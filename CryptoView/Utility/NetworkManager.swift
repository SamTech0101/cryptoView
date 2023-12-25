//
//  NetworkManager.swift
//  CryptoView
//
//  Created by Sepehr on 25/12/2023.
//

import Foundation
import Combine
class NetworkManager {
    enum NetworkError : LocalizedError {
        case badURLResponse(url : URL)
        case unkown
        var errorDescription: String? {
            switch self {
            case .badURLResponse(let url) :
                return "[🔥] Bad response from URL: \(url)"
            case .unkown:
                return "[⚠️] Unknown error occured"
            }
        }
    }
    static func fetchData(url : URL) -> AnyPublisher<Data, any Error> {
      return  URLSession.shared.dataTaskPublisher(for: url)
             .subscribe(on: DispatchQueue.global(qos: .default))
             .tryMap{ output -> Data in
                 try   handleURLResponse(output: output, url: url)
             }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output , url : URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkError.badURLResponse(url: url)
        }
        return output.data
        
    }
    static func handleCompletion(completion :  Subscribers.Completion<Error>){
              switch completion {
        
              case .finished:
                  break
              case .failure(let error):
                  debugPrint("CoinDataService --> fetchCoins --> \(error.localizedDescription)")
              }}
    }
    
    
    

