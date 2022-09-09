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
                    print("play file: \(pathDirectory)/\(selectedFiles)")
                    if playAudio{
                        playSound(sound: "file:///Users/huf/Library/Developer/CoreSimulator/Devices/DB95F3EB-A8C0-4539-99D5-BB7226376029/data/Containers/Data/Application/5E99D58A-30A9-4B1E-919D-948A0208C872/Documents/02.%20Ne%20zabudu.mp3", type: "mp3")
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
