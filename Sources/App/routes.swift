import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "Lütfen Kullanıcı Kaydı için baseURL/signup yapınız"
    }

    app.get("messages") { req async throws -> Song in
        let message = "Merhaba bu bir test mesajıdır"
        let id = UUID()
        return Song(id: id,title: "", message: message)
    }
    try app.register(collection: SignUpController())
    try app.register(collection: SongController())
    
}
