//
//  NetworkServiceCombine.swift
//  JobLooking
//
//  Created by Vladimir on 19.03.2024.
//

import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()

    private var cancellable: AnyCancellable?

    private init() {}

    func fetchDataWithCombine() -> AnyPublisher<[Vacancy], Never> {
        guard let url = URL(string: API.jobURL.rawValue) else {
            return  Just([Vacancy]()).eraseToAnyPublisher()
            }
            return fetch(url)
            .map { (response: Job) -> [Vacancy] in
                return response.vacancies
                }
                .replaceError(with: [Vacancy]())
                .eraseToAnyPublisher()
        }
    
     func fetchDataWithCombine() -> AnyPublisher<[Offer], Never> {
        guard let url = URL(string: API.jobURL.rawValue) else {
            return  Just([Offer]()).eraseToAnyPublisher()
            }
         return fetch(url)
         .map { (response: Job) -> [Offer] in
             return response.offers
             }
             .replaceError(with: [Offer]())
             .eraseToAnyPublisher()
        }
    
    func fetch<T: Decodable>(_ url: URL) -> AnyPublisher<T, Error> {
                       URLSession.shared.dataTaskPublisher(for: url)
                        .map { $0.data}
                        .decode(type: T.self, decoder: JSONDecoder())
                        .receive(on: RunLoop.main)
                        .eraseToAnyPublisher()
        }
}



