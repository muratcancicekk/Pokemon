//
//  Network.swift
//  Pokemon
//
//  Created by Murat on 27.10.2022.
//

import Foundation

struct Network {
    static let shared = Network()
    func networkReq(url: String, success : @escaping (Pokemon) -> ()) {
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let decoded = try? decoder.decode(Pokemon.self, from: data) {
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        success(decoded)
                    }
                }
            }
        }.resume()
    }
    func fetch (url: String, completion: @escaping(Result<PokemonHomeModel, Error>) -> Void) {

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
                let product = try decoder.decode(PokemonHomeModel.self, from: data)
                completion(.success(product))
            }
            catch {
                print(error.localizedDescription)
            }

        })
        dataTask.resume()

    }
}
