import UIKit

//extension CGFloat {
//    static func random() -> CGFloat {
//        return CGFloat(arc4random()) / CGFloat(UInt32.max)
//    }
//}

//extension UIColor {
//    static func random() -> UIColor {
//        return UIColor(
//           red:   .random(),
//           green: .random(),
//           blue:  .random(),
//           alpha: 1.0
//        )
//    }
//}

class HueGameViewController: UIViewController {
    
    let myView = HueGameView()
    let pauseView = PauseView()
    let descriptionHueView = DescriptionHueView()
    let endGameViewController = EndGameViewController()
    var level: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        view.addSubview(descriptionHueView)
        
        myView.hueSlider.addTarget(self, action: #selector(self.sliderValueDidChange), for: .valueChanged)
        myView.hueSlider.addTarget(self, action: #selector(self.isCorrect), for: .touchUpInside)
        myView.hueSlider.addTarget(self, action: #selector(self.isCorrect), for: .touchUpOutside)
        
        myView.pauseButton.addTarget(self, action: #selector(pauseGame), for: .touchUpInside)
        
        pauseView.resumeButton.addTarget(self, action: #selector(resumeGame), for: .touchUpInside)
        pauseView.quitButton.addTarget(self, action: #selector(quitGame), for: .touchUpInside)
        pauseView.musicButton.addTarget(self, action: #selector(toggleMusic), for: .touchUpInside)
        pauseView.soundButton.addTarget(self, action: #selector(toggleSound), for: .touchUpInside)
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider!){
        let changedValue = CGFloat(sender.value)
        myView.innerCircle.backgroundColor = UIColor(hue: changedValue, saturation: 1, brightness: 1, alpha: 1)
    }
    
    @objc func isCorrect(_ sender: UISlider!) {
        sender.isEnabled = false
        let sliderValue = CGFloat(sender.value)
        let scoreVariations: [CGFloat] = [0.0015625, 0.025, 0.05, 0.125, 1]
        var ranges: [ClosedRange<CGFloat>] = []
        for i in 0..<scoreVariations.count {
            let minValue: CGFloat = (myView.outerHue - scoreVariations[i])//.truncatingRemainder(dividingBy: 1)
            let maxValue: CGFloat = (myView.outerHue + scoreVariations[i])//.truncatingRemainder(dividingBy: 1)
            ranges.append(minValue...maxValue)
        }
        for i in 0..<ranges.count {
            if ranges[i].contains(sliderValue) {
                myView.levels[level].backgroundColor = myView.scoreColors[i]
                SoundController.shared.playSound(tag: i)
                endGameViewController.myView.score += Int(200-(200*scoreVariations[i]))
                myView.scoreStrokeLabels[i].isHidden = false
                myView.scoreLabels[i].isHidden = false
                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [self] timer in
                    if level >= myView.levels.count {
                        endGame()
                    } else {
                        reset()
                        myView.scoreStrokeLabels[i].isHidden = true
                        myView.scoreLabels[i].isHidden = true
                        sender.isEnabled = true
                    }
                }
                break
            }
        }
        level += 1
    }
    
    @objc func pauseGame() {
        myView.addSubview(pauseView)
    }
    
    @objc func resumeGame() {
        pauseView.removeFromSuperview()
    }
    
    @objc func quitGame() {
        navigationController?.popViewController(animated: true)
    }

    @objc func toggleMusic() {
        SoundController.shared.toggleMusic(button: pauseView.musicButton, imageOn: pauseView.musicOnImage, imageOff: pauseView.musicOffImage)
    }
    
    @objc func toggleSound() {
        SoundController.shared.toggleSound(button: pauseView.soundButton, imageOn: pauseView.soundOnImage, imageOff: pauseView.soundOffImage)
    }
    
    func reset() {
        myView.outerHue = CGFloat.random(in: 0...1)
        myView.innerCircle.backgroundColor = UIColor(hue: myView.innerHue, saturation: 1, brightness: 1, alpha: 1)
        myView.outerCircle.backgroundColor = UIColor(hue: myView.outerHue, saturation: 1, brightness: 1, alpha: 1)
        myView.hueSlider.value = 0
    }
    
    func endGame() {
        navigationController?.pushViewController(endGameViewController, animated: true)
    }
}
