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
    @State private var pathFolder = ""
    @State private var pathFile = ""
    @State private var playAudio = true
    @State private var selectedFiles = ""
    @State private var pathDirectory = getDocumentsDirectory()
    
    var body: some View {
        NavigationView{
        VStack{
            Text("Title Albom")
                .font(.system(size: 30, weight: .light, design: .serif))
                .italic()
                .lineLimit(1)
            Spacer()
            Image("NoName")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .shadow(radius: 7)
            Spacer()
            Slider(value: $speed,
                   in: 0...100,
                   step: 1){
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
                Button(action: {
                    //print("play file: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
                    if playAudio{
                        playSound(sound: "/Users/huf/Library/Developer/CoreSimulator/Devices/DB95F3EB-A8C0-4539-99D5-BB7226376029/data/Containers/Bundle/Application/0D7151FC-DBA4-4486-8434-D452BF354BFD/ReleasePlayerMp3.app/01. Money.mp3", type: "mp3")
                    }else{
                        stopSound()
                    }
                    playAudio.toggle()
                }, label: {
                    Text(playAudio ? "Play" : "Stop")
                })
                Spacer()
                Button{
                    print("pressed next track")
                } label: {
                    Text("Next track")
                }
                Spacer()
                NavigationLink{
                    ListFolder(selectedFiles: $selectedFiles)
                } label: {
                    Text("Folders")
                }
                /*
                Button{
                    print("pressed folders")
                } label: {
                    Text("Folders")
                }*/
            }
            .padding()
        }
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
