//
//  AudioPlayer.swift
//  ReleasePlayerMp3
//
//  Created by huf on 02.09.2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    //print("sound: \(sound)")
    print(Bundle.main.path(forResource: sound, ofType: type))
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            print("play sound: \(URL(fileURLWithPath: path))")
        }catch{
            print("Could not find and play the sound file")
        }
    }
}

func stopSound(){
    audioPlayer?.stop()
}
