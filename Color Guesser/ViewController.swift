//
//  ViewController.swift
//  Color Guesser
//
//  Created by Nathalia do Valle Papst on 02/06/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var curiosidades: UIButton!
    @IBOutlet weak var somMain: UIBarButtonItem!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var Titulo: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBotao()
        play.topAnchor.constraint(equalTo: Titulo.bottomAnchor, constant: view.bounds.height * 0.1).isActive = true
    }
    
    func setBotao() {
        
        if SoundController.shared.estadoSom {
            somMain.image = UIImage(systemName: "speaker")
        } else {
            somMain.image = UIImage(systemName: "speaker.slash")
        }
    }
    
    @IBAction func somMuda(_ sender: Any) {
        
        SoundController.shared.toggle()
        setBotao()
    }
    
}
