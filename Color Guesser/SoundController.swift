//
//  SoundController.swift
//  Color Guesser
//
//  Created by Nathalia do Valle Papst on 17/06/21.
//

import AVFoundation

class SoundController {
    
    static let shared = SoundController()
    var backgroundSound: AVAudioPlayer?
    private(set) var estadoSom = UserDefaults.standard.bool(forKey: "EstadoDoSom")
    var previousSound: AVAudioPlayer?
    
    private init() {
        if let audioFile = Bundle.main.url(forResource: "audioColor", withExtension: "mp3") {
            do {
                try self.backgroundSound = AVAudioPlayer(contentsOf: audioFile)
                self.backgroundSound?.numberOfLoops = -1
                self.backgroundSound?.volume = 0.1
                
            }
            catch {
                print("Erro ao tentar tocar o som: \(error)")
            }
        } else {
            print("Áudio não encontrado")
        }
        
        if estadoSom {
            backgroundSound?.play()
        } else {
            backgroundSound?.pause()
        }
    }
    
    public func toggle() {
        
        estadoSom = !estadoSom
        
        if estadoSom {
            backgroundSound?.play()
        } else {
            backgroundSound?.pause()
        }
        
        UserDefaults.standard.setValue(estadoSom, forKey: "EstadoDoSom")
    }
}
