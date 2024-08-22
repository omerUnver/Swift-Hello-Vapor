//
//  SongListViewModel.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Foundation
import CryptoKit
class SongListViewModel : ObservableObject {
    @Published var songs = [Song]()
    let httpClient = HttpClient.shared
    func fetchLocalhostData() async throws {
        let urlString = Constants.baseURL + Endpoints.songs
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let songResponse : [Song] = try await httpClient.fetchData(url: url)
        DispatchQueue.main.async {
            self.songs = songResponse
        }
    }
    func postUser(email : String, password : String)async throws{
        let passwordHash = hashPassword(password)
        let postUser = Users(email: email, password: passwordHash)
        
        do {
            try await httpClient.postUser(user: postUser)
        } catch let error{
            debugPrint(error.localizedDescription)
        }
        
    }
    func hashPassword(_ password: String) -> String {
        let data = Data(password.utf8)
        let hash = SHA256.hash(data: data)
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
}

class UsersListViewModel : ObservableObject {
    @Published var users = [Users]()
    let httpClientService = HttpClient.shared
}
