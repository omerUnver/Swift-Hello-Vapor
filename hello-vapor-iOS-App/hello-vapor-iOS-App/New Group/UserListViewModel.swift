//
//  UserListViewModel.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Foundation

class UserListViewModel : ObservableObject {
    @Published var users = [Users]()
    let httpClient = HttpClient.shared
    func getUsers() async throws{
        let urlString = Constants.baseURL + Endpoints.signUp
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let userResponse : [Users] = try await httpClient.fetchData(url: url)
        DispatchQueue.main.async {
            self.users = userResponse
        }
    }
}
