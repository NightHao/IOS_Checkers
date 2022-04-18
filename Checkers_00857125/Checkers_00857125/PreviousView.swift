//
//  PreviousView.swift
//  Checkers_00857125
//
//  Created by nighthao on 2022/4/18.
//

import SwiftUI
import AVFoundation
struct PreviousView: View {
    @State private var showContentView = false
    @State private var showPveView = false
    @State private var nowmode:gamemode = .pvp
    @State private var moveDistance: Double = 50
    @State private var opacity: Double = 1
    let musicPlayer = AVPlayer()
    var body: some View {
        VStack(spacing: 20){
            Button("英國跳棋") {
                moveDistance += 100
                opacity -= 0.3
            }
                .font(.title)
                .onAppear{
                let fileUrl = Bundle.main.url(forResource: "music", withExtension: "mp4")!
                                let playerItem = AVPlayerItem(url: fileUrl)
                                self.musicPlayer.replaceCurrentItem(with: playerItem)
                                self.musicPlayer.play()
                }
                HStack {
                    Image("Image-1")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: moveDistance, y: 0)
                        .opacity(opacity)
                    Spacer()
            }
            Button("PVP"){
                showContentView = true
                nowmode = .pvp
            }.fullScreenCover(isPresented: $showContentView, content:{ContentView(showContentView: $showContentView, nowmode: $nowmode)})
                
            Button("PVE"){
                showPveView = true
                nowmode = .pve
            }.fullScreenCover(isPresented: $showPveView, content:{PveView(showPveView: $showPveView, nowmode: $nowmode)})
            }
        }
}

struct PreviousView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousView()
    }
}
