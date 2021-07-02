import UIKit

class HueGameView: UIView {
    
    let outerCircle = UIView()
    let innerCircle = UIView()
    var outerHue = CGFloat.random(in: 0...1)
    var innerHue: CGFloat = 0
    let hueSlider = UISlider()
    let pauseButton = UIButton(type: .system)
    let levels: [UIView] = [UIView(),
                            UIView(),
                            UIView(),
                            UIView(),
                            UIView()]
    let scoreLabels: [UILabel] = [
        UILabel(),
        UILabel(),
        UILabel(),
        UILabel(),
        UILabel()
    ]
    let scoreStrokeLabels: [UILabel] = [
        UILabel(),
        UILabel(),
        UILabel(),
        UILabel(),
        UILabel()
    ]
    let scoreColors: [UIColor] = [
        UIColor(hue: 180/360, saturation: 1, brightness: 1, alpha: 1),
        UIColor(hue: 90/360, saturation: 1, brightness: 1, alpha: 1),
        UIColor(hue: 60/360, saturation: 1, brightness: 1, alpha: 1),
        UIColor(hue: 30/360, saturation: 1, brightness: 1, alpha: 1),
        UIColor(hue: 0, saturation: 1, brightness: 1, alpha: 1),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.15, alpha: 1)
        
        addSubview(outerCircle)
        addSubview(innerCircle)
        addSubview(hueSlider)
        addSubview(pauseButton)
        for i in 0..<levels.count {
            addSubview(levels[i])
        }
        for i in 0..<scoreLabels.count {
            addSubview(scoreStrokeLabels[i])
            addSubview(scoreLabels[i])
        }
        
        // Outer Circle
        
        outerCircle.backgroundColor = UIColor(hue: outerHue, saturation: 1, brightness: 1, alpha: 1)
        outerCircle.layer.cornerRadius = bounds.size.width*0.375
        
        outerCircle.translatesAutoresizingMaskIntoConstraints = false
        let outerCircleConstraints: [NSLayoutConstraint] = [
            outerCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            outerCircle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40),
            outerCircle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            outerCircle.heightAnchor.constraint(equalTo: outerCircle.widthAnchor),
        ]
        NSLayoutConstraint.activate(outerCircleConstraints)
        
        // Inner Circle
        
        innerCircle.backgroundColor = UIColor(hue: innerHue, saturation: 1, brightness: 1, alpha: 1)
        innerCircle.layer.cornerRadius = bounds.size.width*0.1875
        
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        let innerCircleConstraints: [NSLayoutConstraint] = [
            innerCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: outerCircle.centerYAnchor),
            innerCircle.widthAnchor.constraint(equalTo: outerCircle.widthAnchor, multiplier: 0.5),
            innerCircle.heightAnchor.constraint(equalTo: outerCircle.heightAnchor, multiplier: 0.5)
        ]
        NSLayoutConstraint.activate(innerCircleConstraints)
        
        // Hue Slider
        
        hueSlider.tintColor = .white
        
        hueSlider.translatesAutoresizingMaskIntoConstraints = false
        let sliderConstraints: [NSLayoutConstraint] = [
            hueSlider.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            hueSlider.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            hueSlider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100)
        ]
        NSLayoutConstraint.activate(sliderConstraints)
        
        // Pause Button
       
        pauseButton.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        let pause = UIImage(systemName: "pause", withConfiguration: config)
        pauseButton.setImage(pause, for: .normal)
        pauseButton.layer.cornerRadius = 10
        pauseButton.tintColor = .white
        
        pauseButton.translatesAutoresizingMaskIntoConstraints = false
        let pauseButtonConstraints: [NSLayoutConstraint] = [
            pauseButton.widthAnchor.constraint(equalToConstant: 50),
            pauseButton.heightAnchor.constraint(equalToConstant: 50),
            pauseButton.bottomAnchor.constraint(equalTo: levels[0].topAnchor, constant: 50-UIScreen.main.bounds.width*0.18375),
            pauseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(pauseButtonConstraints)
        
        // Levels
        
        for i in 0..<levels.count {
            levels[i].backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 1)
            levels[i].layer.cornerRadius = 10
            
            levels[i].translatesAutoresizingMaskIntoConstraints = false
            let levelConstraints: [NSLayoutConstraint] = [
                levels[i].widthAnchor.constraint(equalToConstant: 50),
                levels[i].heightAnchor.constraint(equalToConstant: 50),
                levels[i].topAnchor.constraint(equalTo: topAnchor, constant: 150),
                levels[i].leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(30+(CGFloat(i)*UIScreen.main.bounds.width*0.18375))),
            ]
            NSLayoutConstraint.activate(levelConstraints)
        }
        
        // Score Labels
        
        let scoreStrings: [String] = [
            " Perfect! ",
            " Very Good! ",
            " Good! ",
            " OK. ",
            " Poor... ",
        ]
        for i in 0..<scoreLabels.count {
            addScoreLabels(target: i, string: scoreStrings[i])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addScoreLabels(target: Int, string: String) {
        scoreLabels[target].attributedText = NSAttributedString(
            string: string,
            attributes: [
                .foregroundColor: UIColor.white,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        scoreStrokeLabels[target].attributedText = NSAttributedString(
            string: string,
            attributes: [
                .strokeColor: UIColor.black,
                .strokeWidth: 16,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        scoreLabels[target].translatesAutoresizingMaskIntoConstraints = false
        scoreStrokeLabels[target].translatesAutoresizingMaskIntoConstraints = false
        let scoreLabelConstraints: [NSLayoutConstraint] = [
            scoreStrokeLabels[target].centerXAnchor.constraint(equalTo: innerCircle.centerXAnchor),
            scoreStrokeLabels[target].centerYAnchor.constraint(equalTo: innerCircle.centerYAnchor),
            scoreLabels[target].centerYAnchor.constraint(equalTo: scoreStrokeLabels[target].centerYAnchor),
            scoreLabels[target].centerXAnchor.constraint(equalTo: scoreStrokeLabels[target].centerXAnchor)
        ]
        NSLayoutConstraint.activate(scoreLabelConstraints)
        scoreStrokeLabels[target].isHidden = true
        scoreLabels[target].isHidden = true
    }
}
