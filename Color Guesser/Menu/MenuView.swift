import UIKit

class MenuView: UIView {
    
    let logoImageView = UIImageView()
    let playButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        addSubview(logoImageView)
        addSubview(playButton)
        addSubview(settingsButton)
        
        // Logo
        
        logoImageView.image = UIImage(named: "MenuLogo")
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let logoImageViewConstraints: [NSLayoutConstraint] = [
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topAnchor, constant: 300),
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.9)
        ]
        NSLayoutConstraint.activate(logoImageViewConstraints)
        
        // Play Button
        
        playButton.setTitle("PLAY", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        playButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        playButton.layer.cornerRadius = 16
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        let playButtonConstraints: [NSLayoutConstraint] = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            playButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -300),
            playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        
        // Settings Button
        
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        settingsButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        settingsButton.layer.cornerRadius = 16
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        let settingsButtonConstraints: [NSLayoutConstraint] = [
            settingsButton.trailingAnchor.constraint(equalTo: playButton.trailingAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: playButton.leadingAnchor),
            settingsButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 16),
            settingsButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3)
        ]
        NSLayoutConstraint.activate(settingsButtonConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
