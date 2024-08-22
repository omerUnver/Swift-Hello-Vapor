//
//  SignUpController.swift
//
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Fluent
import Vapor

struct SignUpController : RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let users = routes.grouped("signup")
        users.get(use: index)
        users.post(use: create)
    }
    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }
    
    //Create //POST Request / songs route
    func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).transform(to: .ok)
    }
}
