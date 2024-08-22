//
//  Song.swift
//
//
//  Created by M.Ömer Ünver on 21.08.2024.
//

import Fluent
import Vapor

final class Song : Model, Content {
    static let schema = "songs"
    @ID(key: .id)
    var id : UUID?
    @Field(key: "title")
    var title : String
    @Field(key: "message")
    var message : String
    init(){}
    
    init(id: UUID? = nil, title: String, message : String) {
        self.id = id
        self.title = title
        self.message = message
    }
}
