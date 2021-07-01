import AVFoundation
import UIKit

class SoundController {
    
    static let shared = SoundController()
    var backgroundMusic: AVAudioPlayer?
    private(set) var musicMuted = UserDefaults.standard.bool(forKey: "MusicMuted")
    private(set) var soundMuted = UserDefaults.standard.bool(forKey: "SoundMuted")
    let levelsSoundName: [String] = [
        "LevelPerfectSound",
        "LevelVeryGoodSound",
        "LevelGoodSound",
        "LevelOkSound",
        "LevelPoorSound"
    ]
    var levelsSound: [AVAudioPlayer?] = []
    
    private init() {
        if let audioFile = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            do {
                try backgroundMusic = AVAudioPlayer(contentsOf: audioFile)
                backgroundMusic?.numberOfLoops = -1
                backgroundMusic?.volume = 0.1
            }
            catch {
                print("Cannot play audio file (error: \(error))\n")
            }
        } else {
            print("Audio file not found.\n")
        }
        
        for i in 0..<levelsSoundName.count {
            if let audioFile = Bundle.main.url(forResource: levelsSoundName[i], withExtension: "wav") {
                do {
                    let levelSound = try AVAudioPlayer(contentsOf: audioFile)
                    levelsSound.append(levelSound)
                    levelsSound[i]?.numberOfLoops = 0
                    levelsSound[i]?.volume = 0.1
                }
                catch {
                    print("Cannot play audio file (error: \(error))\n")
                }
            } else {
                print("Audio file not found.\n")
            }
        }
        
        start()
    }
    
    public func toggleMusic(button: UIButton, imageOn: UIImage!, imageOff: UIImage!) {
        musicMuted = !musicMuted
        if musicMuted {
            backgroundMusic?.pause()
            button.setImage(imageOff, for: .normal)
        } else {
            backgroundMusic?.play()
            button.setImage(imageOn, for: .normal)
        }
        UserDefaults.standard.setValue(musicMuted, forKey: "MusicMuted")
    }
    
    public func toggleSound(button: UIButton, imageOn: UIImage!, imageOff: UIImage!) {
        soundMuted = !soundMuted
        if soundMuted {
            button.setImage(imageOff, for: .normal)
        } else {
            button.setImage(imageOn, for: .normal)
        }
        UserDefaults.standard.setValue(soundMuted, forKey: "SoundMuted")
    }
    
    public func playSound(tag: Int) {
        if !soundMuted {
            switch tag {
                case 0:
                    levelsSound[0]?.play()
                case 1:
                    levelsSound[1]?.play()
                case 2:
                    levelsSound[2]?.play()
                case 3:
                    levelsSound[3]?.play()
                case 4:
                    levelsSound[4]?.play()
                default:
                    return
            }
        }
    }
    
    public func start() {
        if musicMuted {
            backgroundMusic?.pause()
        } else {
            backgroundMusic?.play()
        }
    }
}
