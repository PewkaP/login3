//
//  LogginedView.swift
//  login
//
//  Created by Piotr Plewka on 04/06/2024.
//

import SwiftUI
import CoreData
struct LogginedView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.iduser, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    @Binding var userID: Int32
    var body: some View {
        VStack{
            if let user = users.first(where: { $0.iduser == userID }) {
                Text("Hello logged in user \(user.email ?? "Unknown")")
                Image("Image\(userID)")
            }
        }
        
        
    }
}

#Preview {
    LogginedView(userID: .constant(1))
}
