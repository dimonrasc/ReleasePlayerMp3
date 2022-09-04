//
//  ListFolder.swift
//  ReleasePlayerMp3
//
//  Created by huf on 02.09.2022.
//

import SwiftUI

struct ListFolder: View {
    
    @State var files = getFiles()
    @State var folders = getFolders()

    var body: some View {
        VStack{
            HStack{
                NavigationLink{
                    ContentView()
                } label: {
                    
                }
                .navigationTitle("DocumentFolder")
                Spacer()
            }
            /*
            ScrollView{
                ForEach(0..<files.count, id: \.self) { item in
                    HStack{
                        Image(systemName: "play")
                            .padding()
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Button(){
                            print("Taped files: " , files[item])
                        } label: {
                            Text(files[item])
                        }
                        
                        Spacer()
                    }
                }
                ForEach(0..<folders.count, id: \.self) { item in
                    HStack{
                        Image(systemName: "folder")
                            .padding()
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Button(){
                            print("Taped folder: " , folders[item])
                        } label: {
                            Text(folders[item])
                        }
                        Spacer()
                    }
                }
            }
             */
            List{
                ForEach(0..<folders.count, id: \.self) { item in
                    HStack{
                        Image(systemName: "folder")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Button(){
                            print("Taped folder: " , folders[item])
                        } label: {
                            Text(folders[item])
                        }
                        Spacer()
                    }
            }
                ForEach(0..<files.count, id: \.self) { item in
                    HStack{
                        Image(systemName: "music.note")
                            .padding()
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                        Button(){
                            print("Taped files: " , files[item])
                        } label: {
                            Text(files[item])
                        }
                        
                        Spacer()
                    }
                }
            Spacer()
        }
        .padding()
    }
}
/*
func getFiles() -> Array<String> {
    
    var files: [String] = []
    let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    do{
        let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
        //print("dir: " , directoryContents)
        let mpFiles = directoryContents.filter{$0.pathExtension == "mp3"}
        let mpFileNames = mpFiles.map{$0.deletingPathExtension().lastPathComponent}
        files.append(contentsOf: mpFileNames)
    } catch{
        print("error: " , error)
    }
    print("files: " , files)
    files.sort()
    return files
}
*/
struct ListFolder_Previews: PreviewProvider {
    static var previews: some View {
        ListFolder()
        }
    }
}
