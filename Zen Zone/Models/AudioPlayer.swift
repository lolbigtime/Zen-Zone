//
//  AudioPlayer.swift
//  Zen Zone
//
//  Created by Tai Wong on 10/25/23.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    func playSound(soundName: String, soundExtension: String) {
        if let audioURL = Bundle.main.path(forResource: soundName, ofType: soundExtension) {
            let url = URL(fileURLWithPath: audioURL)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
            } catch {
                print("error")
            }
            
            audioPlayer?.volume = 1
            audioPlayer?.play()
        } else {
            print("Error: Sound file not found")
        }
    }
}
