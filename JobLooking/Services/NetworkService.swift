//
//  NetworkService.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import Foundation

enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingError
}

class NetworkService {
    static let shared = NetworkService()

    private init() {}

    func fetchJob() async throws -> Job {
        guard let url = URL(string: API.jobURL.rawValue) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let jobInfo = try? decoder.decode(Job.self, from: data) else {
            throw NetworkError.decodingError
        }
        return jobInfo
    }
}
