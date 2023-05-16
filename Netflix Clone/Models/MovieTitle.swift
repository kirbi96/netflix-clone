//
//  Movie.swift
//  Netflix Clone
//
//  Created by Макаров Кирилл Андреевич on 16.05.2023.
//

import Foundation

struct MoviesTitleResponse: Codable {
    let films: [MovieTitle]
}

struct MovieTitle: Codable {
    let filmId: Int
    let filmLength: String?
    let nameEn: String?
    let nameRu: String?
    let posterUrl: String?
    let posterUrlPreview: String?
    let rating: String?
    let year: String?
}

