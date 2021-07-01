import UIKit

class SaturationGameViewController: UIViewController {
    
    let outerCircle = UIView()
    let innerCircle = UIView()
    var outerSaturation = CGFloat.random(in: 0...1)
    var innerSaturation: CGFloat = 0
    let saturationSlider = UISlider()
    let pauseButton = UIButton()
    let levelOne = UIView()
    let levelTwo = UIView()
    let levelThree = UIView()
    let levelFour = UIView()
    let levelFive = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.15, alpha: 1)
        
        view.addSubview(outerCircle)
        view.addSubview(innerCircle)
        view.addSubview(saturationSlider)
        view.addSubview(pauseButton)
        view.addSubview(levelOne)
        view.addSubview(levelTwo)
        view.addSubview(levelThree)
        view.addSubview(levelFour)
        view.addSubview(levelFive)
        
        // Outer Circle
        
        outerCircle.backgroundColor = UIColor(hue: 0, saturation: outerSaturation, brightness: 1, alpha: 1)
        outerCircle.layer.cornerRadius = view.bounds.size.width*0.375
        
        outerCircle.translatesAutoresizingMaskIntoConstraints = false
        let outerCircleConstraints: [NSLayoutConstraint] = [
            outerCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            outerCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            outerCircle.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            outerCircle.heightAnchor.constraint(equalTo: outerCircle.widthAnchor)
        ]
        NSLayoutConstraint.activate(outerCircleConstraints)
        
        // Inner Circle
        
        innerCircle.backgroundColor = UIColor(hue: 0, saturation: innerSaturation, brightness: 1, alpha: 1)
        innerCircle.layer.cornerRadius = view.bounds.size.width*0.1875
        
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        let innerCircleConstraints: [NSLayoutConstraint] = [
            innerCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 50),
            
            innerCircle.widthAnchor.constraint(equalTo: outerCircle.widthAnchor, multiplier: 0.5),
            
            innerCircle.heightAnchor.constraint(equalTo: outerCircle.heightAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(innerCircleConstraints)
        
        // Hue Slider
        
        saturationSlider.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.15, alpha: 1)
        saturationSlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        saturationSlider.addTarget(self, action: #selector(self.isCorrect(_:)), for: .touchUpInside)
        saturationSlider.addTarget(self, action: #selector(self.isCorrect(_:)), for: .touchUpOutside)
        saturationSlider.translatesAutoresizingMaskIntoConstraints = false
        let sliderConstraints: [NSLayoutConstraint] = [
            saturationSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            saturationSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            saturationSlider.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -125)
        ]
        NSLayoutConstraint.activate(sliderConstraints)
        
        // Label
        
//        descricao.translatesAutoresizingMaskIntoConstraints = false
//        descricao.text = "FIND THE CORRECT\nSATURATION"
//        descricao.numberOfLines = 0
//        descricao.lineBreakMode = .byWordWrapping
//        descricao.textAlignment = .center
//        descricao.textColor = .white
//        descricao.font = .systemFont(ofSize: 27, weight: .bold)
//
//        let descricaoConstraints: [NSLayoutConstraint] = [
//            descricao.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descricao.bottomAnchor.constraint(equalTo: outerCircle.topAnchor, constant: -40)
//        
//        ]
//        NSLayoutConstraint.activate(descricaoConstraints)
        
        // pause button
        
        pauseButton.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        let pause = UIImage(systemName: "pause", withConfiguration: config)
        pauseButton.setImage(pause, for: .normal)
        pauseButton.layer.cornerRadius = 8
        pauseButton.tintColor = .white
//        pauseButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        let pauseButtonConstraints: [NSLayoutConstraint] = [
            pauseButton.widthAnchor.constraint(equalToConstant: 50),
            pauseButton.heightAnchor.constraint(equalToConstant: 50),
            pauseButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -710),
            pauseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -310),
           
            
        
        ]
        NSLayoutConstraint.activate(pauseButtonConstraints)
        
        //levelOne
        
        levelOne.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        levelOne.layer.cornerRadius = 8
        
        levelOne.translatesAutoresizingMaskIntoConstraints = false
        let levelOneConstraints: [NSLayoutConstraint] = [
            levelOne.widthAnchor.constraint(equalToConstant: 50),
            levelOne.heightAnchor.constraint(equalToConstant: 50),
            levelOne.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            levelOne.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -310),
        ]
        NSLayoutConstraint.activate(levelOneConstraints)
        
        
        //levelTwo
        
        levelTwo.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        levelTwo.layer.cornerRadius = 8
        
        levelTwo.translatesAutoresizingMaskIntoConstraints = false
        let levelTwoConstraints: [NSLayoutConstraint] = [
            levelTwo.widthAnchor.constraint(equalToConstant: 50),
            levelTwo.heightAnchor.constraint(equalToConstant: 50),
            levelTwo.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            levelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -240),
        ]
        NSLayoutConstraint.activate(levelTwoConstraints)
        
        // levelThree
        
        levelThree.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        levelThree.layer.cornerRadius = 8
        
        levelThree.translatesAutoresizingMaskIntoConstraints = false
        let levelThreeConstraints: [NSLayoutConstraint] = [
            levelThree.widthAnchor.constraint(equalToConstant: 50),
            levelThree.heightAnchor.constraint(equalToConstant: 50),
            levelThree.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            levelThree.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -170),
        ]
        NSLayoutConstraint.activate(levelThreeConstraints)
        
        // levelFour
        
        levelFour.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        levelFour.layer.cornerRadius = 8
        
        levelFour.translatesAutoresizingMaskIntoConstraints = false
        let levelFourConstraints: [NSLayoutConstraint] = [
            levelFour.widthAnchor.constraint(equalToConstant: 50),
            levelFour.heightAnchor.constraint(equalToConstant: 50),
            levelFour.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            levelFour.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100),
        ]
        NSLayoutConstraint.activate(levelFourConstraints)
        
        // levelFive
        
        levelFive.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        levelFive.layer.cornerRadius = 8
        
        levelFive.translatesAutoresizingMaskIntoConstraints = false
        let levelFiveConstraints: [NSLayoutConstraint] = [
            levelFive.widthAnchor.constraint(equalToConstant: 50),
            levelFive.heightAnchor.constraint(equalToConstant: 50),
            levelFive.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -600),
            levelFive.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
        ]
        NSLayoutConstraint.activate(levelFiveConstraints)
        
        
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider!){
        let changedValue = CGFloat(sender.value)
        innerCircle.backgroundColor = UIColor(hue: 0, saturation: changedValue, brightness: 1, alpha: 1)
    }
      
//    func setBotao() {
//
//        if SoundController.shared.estadoSom {
//            somGame.image = UIImage(systemName: "speaker")
//        } else {
//            somGame.image = UIImage(systemName: "speaker.slash")
//        }
//    }

    @objc func isCorrect(_ sender: UISlider!) {
        let changedValue = CGFloat(sender.value)
        let variation: CGFloat = 0.05
        let minValue: CGFloat = (outerSaturation - variation)
        let maxValue: CGFloat = (outerSaturation + variation)
        let range = minValue...maxValue
        if range.contains(changedValue) {
//            checkView.isHidden = false
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {timer in
                self.reset()
//                self.checkView.isHidden = true
            }
        }
    }

//    func somMuda(_ sender: Any) {
//
//        SoundController.shared.toggle()
//        setBotao()
//    }
//
//
       
    func reset() {
        outerSaturation = CGFloat.random(in: 0...1)
        innerCircle.backgroundColor = UIColor(hue: 0, saturation: innerSaturation, brightness: 1, alpha: 1)
        outerCircle.backgroundColor = UIColor(hue: 0, saturation: outerSaturation, brightness: 1, alpha: 1)
        saturationSlider.value = 0
    }
}
