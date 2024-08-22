//
//  SongController.swift
//
//
//  Created by M.Ömer Ünver on 21.08.2024.
//

import Fluent
import Vapor

struct SongController : RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let songs = routes.grouped("songs")
        songs.get(use: index)
        songs.post(use: create)
    }
    
    // songs route //GET Request
    func index(req: Request) throws -> EventLoopFuture<[Song]> {
        return Song.query(on: req.db).all()
    }
    
    //Create //POST Request / songs route
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let song = try req.content.decode(Song.self)
        return song.save(on: req.db).transform(to: .ok)
        
    }
    
    //Update
    
    //Delete
    
    
    
}
