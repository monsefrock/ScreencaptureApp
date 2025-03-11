//
//  ContentView.swift
//  ScreencaptureApp
//
//  Created by Monsef Eledrisse on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ScreencaptureViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200, maximum: 300))]) {
                    ForEach(vm.images, id: \.self){ image in
                        Image(nsImage: image)
                            .resizable()
                            .scaledToFit()
                            .draggable(image)
                    }
                }
            }
            

            HStack {
                Button("Take Area Screenshot") {
                    
                    vm.takeScreenShot(type: .area)
                }
                
                Button("Take Full Screen Screenshot") {
                    vm.takeScreenShot(type: .fullscreen)
                }
                
                Button("Take Window Screenshot")
                {
                    vm.takeScreenShot(type: .window)
                }
            }
            
        }
        .padding()
    }
    
    
}



#Preview {
    ContentView()
}
