//
//  JangGaeJaRangApp.swift
//  JangGaeJaRang
//
//  Created by 최형우 on 2022/08/13.
//

import SwiftUI
import Firebase

@main
struct JangGaeJaRangApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SceneStateViewModel())
                .preferredColorScheme(.light)
        }
    }
}
