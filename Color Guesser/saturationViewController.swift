//
//  saturationViewController.swift
//  Color Guesser
//
//  Created by Nathalia do Valle Papst on 03/06/21.
//

import UIKit
import AVFoundation

class saturationViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var somSat: UIBarButtonItem!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setBotao()
    }
    
    func setBotao() {
        
        if SoundController.shared.estadoSom {
            somSat.image = UIImage(systemName: "speaker")
        } else {
            somSat.image = UIImage(systemName: "speaker.slash")
        }
        
    }
    
    
    @IBAction func somMuda(_ sender: Any) {
       
        SoundController.shared.toggle()
        setBotao()
    }
    
}
