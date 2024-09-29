//
//  caseydatabaseApp.swift
//  caseydatabase
//
//  Created by Casey Feng on 9/28/24.
//

import SwiftUI

@main
struct caseydatabaseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
