//
//  TwitchNetworkManager.swift
//  TwitchAPIWrapper iOS
//
//  Created by Eric Vennaro on 4/2/18.
//

import Foundation

protocol TwitchNetworkManagerService {
    func send<T>(request: URLRequest?, withResponseBodyType responseBodyType: T.Type, completion: @escaping (_ result: Result<T>) -> ()) where T: Decodable
}

final class TwitchNetworkManager: TwitchNetworkManagerService {
    let jsonDecoder = JSONDecoder.twitchAPIStandard()
    
    func send<T>(request: URLRequest?, withResponseBodyType responseBodyType: T.Type, completion: @escaping (_ result: Result<T>) -> ()) where T: Decodable {
        let session = URLSession.shared
        guard let request = request else { return }
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(NetworkJSONServiceError.networkError(error: error)))
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkJSONServiceError.unknownErrorOccurred(desc: "URLResponse was not a HTTPURLResponse")))
                return
            }
            if 200..<400 ~= urlResponse.statusCode {
                guard let data = data else {
                    completion(.failure(NetworkJSONServiceError.noData))
                    return
                }
                completion(self.result(from: data, type: responseBodyType))
            } else {
                completion(.failure(NetworkJSONServiceError.networkResponseError(response: urlResponse)))
            }
        })
        task.resume()
    }
    
    private func result<T>(from data: Data, type: T.Type) -> Result<T> where T: Decodable {
        do {
            let result = try jsonDecoder.decode(type.self, from: data)
            return .success(result)
        } catch {
            EVLog(text: "\(error)", line: #line, fileName: #file)
            return .failure(ParsingError.invalidJSONData)
        }
    }
}
