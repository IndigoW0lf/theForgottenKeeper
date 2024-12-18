//
//  theForgottenKeeperApp.swift
//  theForgottenKeeper
//
//  Created by Kai Indigo Wolf on 12/17/24.
//

import SwiftUI
import SpriteKit

@main
struct theForgottenKeeperApp: App {
    var body: some Scene {
        WindowGroup {
            SpriteView(scene: LibraryScene(size: UIScreen.main.bounds.size))
                .ignoresSafeArea()
        }
    }
}
