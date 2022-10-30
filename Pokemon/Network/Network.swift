//
//  Network.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation

struct Network {
    static let shared = Network()

    func fetch<T:Decodable> (url: String, completion: @escaping(Result<T, Error>) -> Void) {

        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription ?? "")
            } else {
            }

            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let product = try decoder.decode(T.self, from: data)
                completion(.success(product))
            }
            catch {
                print(error.localizedDescription)
            }

        })
        dataTask.resume()

    }
}
