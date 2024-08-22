//
//  HttpClient.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Foundation



class HttpClient : ObservableObject {
    private init(){}
    static let shared = HttpClient()
    
    func fetchData<T: Codable>(url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw 
            URLError(.badServerResponse)
        }
        
        guard let object = try? JSONDecoder().decode([T].self, from: data) else {
            throw
            URLError(.cannotDecodeRawData)
        }
        return object
        
    }
    
    func postUser(user: Users) async throws{
        let url = Constants.baseURL + Endpoints.signUp
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(user)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        debugPrint(data.base64EncodedString())
    }
    
    
    
}
