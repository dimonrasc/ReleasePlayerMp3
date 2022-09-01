//
//  ContentView.swift
//  ReleasePlayerMp3
//
//  Created by huf on 01.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack{
            Spacer()
            Text("Title Albom")
                .font(.system(size: 30, weight: .light, design: .serif))
                .italic()
                .lineLimit(1)
            Spacer()
            Image("cyrcleImageAlbom")
                .frame(width: 200, height: 200)
                .background(Color.blue)
            Spacer()
            Slider(value: $speed,
                   in: 0...100,
                   step: 5){
                Text("Speed")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            } onEditingChanged: { editing in
                isEditing = editing
            }
            Text("\(speed)")
                .foregroundColor(isEditing ? .red : .blue)
            Spacer()
            HStack{
                Button{
                    print("pressed play/pause")
                } label: {
                    Text("Play/Pause")
                }
                Spacer()
                Button{
                    print("pressed next track")
                } label: {
                    Text("Next track")
                }
                Spacer()
                Button{
                    print("pressed folders")
                } label: {
                    Text("Folders")
                }
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
