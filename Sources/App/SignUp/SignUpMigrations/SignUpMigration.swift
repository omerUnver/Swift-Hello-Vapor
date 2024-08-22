//
//  SignUpMigration.swift
//  
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import Fluent
import Vapor

struct SignUpMigration : Migration {
    func prepare(on database: any Database) -> EventLoopFuture<Void> {
        return database.schema("signup")
            .id()
            .field("email", .string, .required)
            .field("password", .string, .required)
            .create()
    }
    func revert(on database: any Database) -> EventLoopFuture<Void> {
        return database.schema("signup")
            .delete()
    }
}

