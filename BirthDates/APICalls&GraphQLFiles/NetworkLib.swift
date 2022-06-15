//
//  NetworkLib.swift
//  BirthDates
//
//  Created by Sukumar Anup Sukumaran on 31/05/2022.
//

import Foundation
import Apollo

enum Results<T> {
    case success(T)
    case failure(errorStr: String, model: T? = nil)
}

class NetworkLib {
    static let shared = NetworkLib()
    var apollo: ApolloClient?
    init(urlStr: String = .mainUrlString) {
        guard let url = URL(string: urlStr) else {return}
        apollo = ApolloClient(url: url)
    }
    func callBirthdaysAPI(comp: @escaping (Results<[BirthdaysQuery.Data.Person]>) -> Void) {
        apollo?.fetch(query: BirthdaysQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                comp(.success(graphQLResult.data?.person ?? []))
            case .failure(let error):
                comp(.failure(errorStr: error.localizedDescription))
            }
        }
    }
}
