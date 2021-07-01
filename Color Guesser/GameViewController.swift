//
//  GameViewController.swift
//  Color Guesser
//
//  Created by Nathalia do Valle Papst on 03/06/21.
//

import UIKit
import AVFoundation

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

class GameViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var circleMain: UIView!
    @IBOutlet weak var circleChange: UIView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var checkView: UIImageView!
    @IBOutlet weak var somGame: UIBarButtonItem!
    var satMain = CGFloat.random(in: 0...1)
    var satChange = CGFloat.random(in: 0...1)
    var cor: CGFloat = .random()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBotao()
    }
    
    func setBotao() {
        
        if SoundController.shared.estadoSom {
            somGame.image = UIImage(systemName: "speaker")
        } else {
            somGame.image = UIImage(systemName: "speaker.slash")
        }
    }
    
    override func viewDidLayoutSubviews() {
        circleMain.layer.cornerRadius = circleMain.bounds.size.width / 2
        circleMain.clipsToBounds = true
        
        circleChange.layer.cornerRadius = circleChange.bounds.size.width / 2
        circleChange.clipsToBounds = true
        
        slider.layer.cornerRadius = slider.bounds.size.width / 30
        slider.clipsToBounds = true
        
        setGame()
    }
    
    func setGame() {
        
        while satMain == satChange || (satChange >= satMain && satChange <= (satMain + 0.1)) || (satChange <= satMain && satChange >= (satMain - 0.1)) {
            satChange = CGFloat.random(in: 0...1)
        }
        
        
        circleMain.backgroundColor = UIColor(hue: cor, saturation: satMain, brightness: 0.66, alpha: 1)
        
        
        circleChange.backgroundColor = UIColor(hue: cor, saturation: satChange, brightness: 0.66, alpha: 1)
        
    }
    
    
    @IBAction func interacao(_ sender: UISlider) {
        let valorAtual = CGFloat(sender.value)

        circleChange.backgroundColor = UIColor(hue: cor, saturation: valorAtual, brightness: 0.66, alpha: 1)
        
        changeSat(valorAtual)

    }
    
    func changeSat(_ valorAtual: CGFloat) {
        satChange = valorAtual
    }
    
    func isCorrect(_ valorAtual: CGFloat) {
        let variation: CGFloat = 0.05
        let minValue: CGFloat = satMain - variation
        let maxValue: CGFloat = satMain + variation
        let range = minValue...maxValue
        
        if range.contains(valorAtual) {
            checkView.isHidden = false
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {timer in
                self.reset()
                self.setGame()
                self.checkView.isHidden = true
            }
            
        }
    }
    
    @IBAction func somMuda(_ sender: Any) {
        
        SoundController.shared.toggle()
        setBotao()
    }
    
    
    @IBAction func correct(_ sender: UISlider) {
        isCorrect(CGFloat(sender.value))
    }
        
    @objc func reset() {
        satMain = CGFloat.random(in: 0...1)
        satChange = CGFloat.random(in: 0...1)
        cor = .random()
    }
    
}
