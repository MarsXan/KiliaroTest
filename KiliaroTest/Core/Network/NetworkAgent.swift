//
//  NetworkAgent.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation
import Combine

struct NetworkAgent {
    func run<T: Decodable>(_ request: URLRequest, isJson: Bool = true) -> AnyPublisher<T, NetworkError> {

        return URLSession.shared
            .dataTaskPublisher(for: self.setReqHeaders(request: request, isJson: isJson))
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    if let httpResponse = response as? HTTPURLResponse {
                        #if DEBUG
                        print("Error Status Code => \(httpResponse.statusCode)")
                        #endif
                        if 400 == httpResponse.statusCode {
                            let res = try JSONDecoder().decode(KiliaroError.self, from: data)
                            throw NetworkError.validationError(res)
                        }
                        if 401 == httpResponse.statusCode {
                            throw NetworkError.missingSession
                        }
                        if 403 == httpResponse.statusCode {
                            NotificationCenter.default.post(.init(name: NotificationUtil.logOutNotification))
                            NotificationCenter.default.post(.init(name: NotificationUtil.hideBottomNavNotification))
                            throw NetworkError.internalServerError
                        }
                        if 404 == httpResponse.statusCode {
                            throw NetworkError.apiNotFound
                        }

                        if 500 == httpResponse.statusCode {
                            throw NetworkError.serverError
                        }
                    }
                    throw NetworkError.unknownError("Unknown Network Error")
                }
                return data
            }
            .handleEvents(receiveOutput: { print(NSString(data: $0.subdata(in: 0..<min(5 * 1024, $0.count)), encoding: String.Encoding.utf8.rawValue)!) })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError {
                ErrorUtil.osErrorToKnownError(error: $0)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
            
            
    }
    
    func setReqHeaders(request:URLRequest,isJson: Bool = true)-> URLRequest  {
        var req = request
        req.addValue("ios", forHTTPHeaderField: "platform")
        
        
        if (isJson) {
            req.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }

        #if DEBUG
        NetworkUtil.logRequest(request: request)
        #endif

        return req
    }
}
