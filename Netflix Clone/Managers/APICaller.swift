//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Макаров Кирилл Андреевич on 15.05.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "d5ca9119-ceb2-4cea-987d-2b13f05e3bc6"
    static let baseURL = "https://kinopoiskapiunofficial.tech/api"
}

enum APIError: Error {
    case failedToGetData
}


class APICaller {
    static let shared = APICaller()
    
    func getBestMovies(completion: @escaping (Result<[MovieTitle], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/v2.2/films/top?type=TOP_250_BEST_FILMS")else{return}
        
        var request = URLRequest(url: url)
        request.setValue(Constants.API_KEY, forHTTPHeaderField: "X-API-KEY")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MoviesTitleResponse.self, from: data)
                completion(.success(results.films))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTopMovies(completion: @escaping (Result<[MovieTitle], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/v2.2/films/top?type=TOP_100_POPULAR_FILMS")else{return}
        
        var request = URLRequest(url: url)
        request.setValue(Constants.API_KEY, forHTTPHeaderField: "X-API-KEY")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MoviesTitleResponse.self, from: data)
                completion(.success(results.films))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getPremierMovies(completion: @escaping (Result<[MovieTitle], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/v2.2/films/top?type=TOP_AWAIT_FILMS")else{return}
        
        var request = URLRequest(url: url)
        request.setValue(Constants.API_KEY, forHTTPHeaderField: "X-API-KEY")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(MoviesTitleResponse.self, from: data)
                completion(.success(results.films))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
}
