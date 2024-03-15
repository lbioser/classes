//
//  TimerPage.swift
//  DemoTimer
//
//  Created by keloopA on 2024/2/29.
//

import SwiftUI

struct TimerPage: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isPlaying = false
    @State var countTime = 10.0
    var body: some View {
        ZStack {
            Circle()
                .stroke(.gray.opacity(0.6), style: StrokeStyle(lineWidth: 10))
        
            Circle()
                .trim(from: 0,to: countTime/20)
                .rotation(Angle(degrees: -90))
                .stroke(.green,style: StrokeStyle(lineWidth: 10))
                .animation(.easeIn, value: countTime)
        
            centerView
            
        }.padding()
            .onReceive(timer, perform: {_ in
                guard countTime > 0 else {
                    countTime = 20
                    return
                }
                if isPlaying{
                    print("hhhhhh")
                    countTime -= 1
                }
                
            })
    }
    
    var centerView: some View{
        HStack(spacing: 20){
            Label("", systemImage: isPlaying ? "pause" : "play" )
                .onTapGesture {
                    isPlaying.toggle()
                }
                
            
            Label("", systemImage: "arrow.clockwise")
                .onTapGesture {
                    countTime = 20
                    isPlaying = false
                }
        }.font(.largeTitle)
    }
    
}

#Preview {
    TimerPage()
}
