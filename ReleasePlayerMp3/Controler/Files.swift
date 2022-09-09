//
//  Files.swift
//  ReleasePlayerMp3
//
//  Created by huf on 03.09.2022.
//

import Foundation

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
        //print("files: " , files)
        files.sort()
        return files
    }

    func getFolders() -> Array<String> {
        
        var folders: [String] = []
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        do{
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
            //print("dir: " , directoryContents)
            let mpFoldes = directoryContents.filter{$0.hasDirectoryPath}
            let mpFolderNames = mpFoldes.map{$0.lastPathComponent}
            folders.append(contentsOf: mpFolderNames)
        } catch{
            print("error: " , error)
        }
        folders.sort()
        return folders
    }

func getDocumentsDirectory() -> String{
    let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    print(documentsUrl)
    return documentsUrl.path
}
