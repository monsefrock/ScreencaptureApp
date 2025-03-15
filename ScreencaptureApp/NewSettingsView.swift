//
//  NewSettingsView.swift
//  ScreencaptureApp
//
//  Created by Monsef Eledrisse on 3/13/25.
//
import SwiftUI
import KeyboardShortcuts

struct NewSettingsView: View {
    var body: some View {
        VStack {
            Text("Settings").font(.largeTitle).padding()
            
            // Area Shortcut Input
            ShortcutInput(label: "Area Shortcut", shortcutName: .areaShortcut)
            
            // Window Shortcut Input
            ShortcutInput(label: "Window Shortcut", shortcutName: .windowShortcut)
            
            // Fullscreen Shortcut Input
            ShortcutInput(label: "Fullscreen Shortcut", shortcutName: .fullscreenShortcut)
            
            Spacer()
        }
        .frame(width: 400, height: 300)
        .padding()
    }
}

// Custom view for shortcut input
struct ShortcutInput: View {
    let label: String
    let shortcutName: KeyboardShortcuts.Name
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            
            HStack {
                // Display the current shortcut
                KeyboardShortcuts.Recorder(for: shortcutName)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        .padding()
    }
}

// Define keyboard shortcut names
extension KeyboardShortcuts.Name {
    static let areaShortcut = Self("areaShortcut")
    static let windowShortcut = Self("windowShortcut")
    static let fullscreenShortcut = Self("fullscreenShortcut")
}

#Preview {
    NewSettingsView()
}
