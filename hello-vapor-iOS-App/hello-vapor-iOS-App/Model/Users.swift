//
//  Users.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Foundation

struct Users: Codable {
    var id : UUID?
    var email : String
    var password: String
}
