//
//  PostUserView.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import SwiftUI

struct PostUserView: View {
    @ObservedObject var vm = SongListViewModel()
    @State var email = ""
    @State var password = ""
    @ObservedObject var userVm = UserListViewModel()
    var body: some View {
        VStack {
            TextField(text: $email) {
                Text("Lütfen Email giriniz")
                    .foregroundColor(.gray)
            }
            .foregroundColor(.black)
            TextField(text: $password) {
                Text("Lütfen Password Giriniz.")
                    .foregroundColor(.gray)
            }
            .foregroundColor(.black)
            
            Button {
                if !email.isEmpty && !password.isEmpty {
                    Task{
                      try await vm.postUser(email: email,password:password)
                    }
                }
                debugPrint("Password ve email boş")
            } label: {
                Text("Kayıt Ol")
            }
            .padding(.top, 10)
            List {
                ForEach(userVm.users, id: \.id) { i in
                    Text("User: \(i.email)")
                    Text("Password : \(i.password)")
                }
            }
            .onAppear(){
                Task {
                    try await userVm.getUsers()
                }
                
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PostUserView()
}
