//
//  CreateSongs.swift
//  
//
//  Created by M.Ömer Ünver on 21.08.2024.
//

import Fluent

struct CreateSongs : Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs")
            .id()
            .field("title", .string, .required)
            .field("message", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs")
            .delete()
    }
    
    
}

