//
//  ContentView.swift
//  ScreencaptureApp
//
//  Created by Monsef Eledrisse on 3/11/25.
//
import SwiftUI
import KeyboardShortcuts

struct ContentView: View {
    @StateObject private var vm = ScreencaptureViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 300))]) {
                    ForEach(vm.images, id: \.self) { image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .draggable(image)
                    }
                }
            }
            
            HStack {
                Button("Take Area Screenshot") {
                    vm.takeScreenShot(for: .area)
                }
                
                Button("Take Full Screen Screenshot") {
                    vm.takeScreenShot(for: .fullscreen)
                }
                
                Button("Take Window Screenshot") {
                    vm.takeScreenShot(for: .window)
                }
            }
        }
        .padding()
        .onAppear {
            // Set up keyboard shortcut handlers
            setupShortcutHandlers()
        }
    }
    
    private func setupShortcutHandlers() {
        // Handle Area Screenshot Shortcut
        KeyboardShortcuts.onKeyUp(for: .areaShortcut) {
            vm.takeScreenShot(for: .area)
        }
        
        // Handle Fullscreen Screenshot Shortcut
        KeyboardShortcuts.onKeyUp(for: .fullscreenShortcut) {
            vm.takeScreenShot(for: .fullscreen)
        }
        
        // Handle Window Screenshot Shortcut
        KeyboardShortcuts.onKeyUp(for: .windowShortcut) {
            vm.takeScreenShot(for: .window)
        }
    }
}

#Preview {
    ContentView()
}
