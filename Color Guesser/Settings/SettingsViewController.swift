import UIKit

class SettingsViewController: UIViewController {
    
    let myView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        myView.musicButton.addTarget(self, action: #selector(toggleMusic), for: .touchUpInside)
        myView.soundButton.addTarget(self, action: #selector(toggleSound), for: .touchUpInside)
        
        myView.backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    @objc func toggleMusic() {
        SoundController.shared.toggleMusic(button: myView.musicButton, imageOn: myView.musicOnImage, imageOff: myView.musicOffImage)
    }
    
    @objc func toggleSound() {
        SoundController.shared.toggleSound(button: myView.soundButton, imageOn: myView.soundOnImage, imageOff: myView.soundOffImage)
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
}
