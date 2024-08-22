//
//  Song.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Foundation

struct Song : Identifiable, Codable {
    let id : UUID?
    var title : String
    var message : String
}
