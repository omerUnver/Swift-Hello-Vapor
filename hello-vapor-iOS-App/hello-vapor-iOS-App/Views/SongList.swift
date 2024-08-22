//
//  SongList.swift
//  hello-vapor-iOS-App
//
//  Created by M.Ömer Ünver on 22.08.2024.
//

import SwiftUI

struct SongList: View {
    @ObservedObject var vm = SongListViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(vm.songs, id: \.id) { i in
                    VStack {
                        Text("Title : \(i.title)")
                            .foregroundColor(Color(.label))
                        Text("Message : \(i.message)")
                            .foregroundColor(Color(.label))
                    }
                    
                }
            }
            .navigationTitle("Localhost")
        }
        .onAppear(){
            Task {
               try await  vm.fetchLocalhostData()
            }
           
        }
    }
}

#Preview {
    SongList()
}
