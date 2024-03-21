//
//  JobModel.swift
//  JobLooking
//
//  Created by Vladimir on 14.03.2024.
//

import Foundation

struct Job: Codable {
    let offers: [Offer]
    let vacancies: [Vacancy]
}

struct Offer: Codable {
    
    let id: String?
    let title: String
    let link: String
    let button: Button?
}

struct Button: Codable {
    let text: String
}

struct Vacancy: Codable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    let isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
}

struct Address: Codable {
    let town, street, house: String
}

struct Experience: Codable {
    let previewText, text: String
}

struct Salary: Codable {
    let full: String
    let short: String?
}

