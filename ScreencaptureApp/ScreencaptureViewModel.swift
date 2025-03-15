//
//  ScreencaptureViewModel.swift
//  ScreencaptureApp
//
//  Created by Monsef Eledrisse on 3/11/25.
//

import SwiftUI

class ScreencaptureViewModel: ObservableObject {
    
    @Published var images = [NSImage]()
    
    enum ScreenshotType {
        
        case fullscreen
        case window
        case area
        
        var processArguments: [String] {
            switch self {
            case .fullscreen:
                return ["-c"]
            case .window:
                return ["-cw"]
            case .area:
                return ["-cs"]
            }
        }
    }

    
    public func takeScreenShot(for type: ScreenshotType) {
        
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        
        task.arguments = type.processArguments
        
        do {
            try task.run()
            task.waitUntilExit()
            
            getCapturedImage()
        } catch {
            print("Error running task: \(error)")
        }
    }
    
    private func getCapturedImage() {
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else {
            return
        }
        
        guard let image = NSImage(pasteboard: .general) else {
            return
        }
        
        self.images.append(image)
    }
    
}
