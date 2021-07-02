import UIKit

class MenuView: UIView {
    
    let logoImageView = UIImageView()
    let playButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setBackground(image: UIImage(named: "Background")!)
        
        addSubview(logoImageView)
        addSubview(playButton)
        addSubview(settingsButton)
        
        // Logo
        
        logoImageView.image = UIImage(named: "MenuLogo")
        logoImageView.contentMode = .scaleAspectFit
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let logoImageViewConstraints: [NSLayoutConstraint] = [
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3)
        ]
        NSLayoutConstraint.activate(logoImageViewConstraints)
        
        // Play Button
        
        playButton.setTitle("PLAY", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        playButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        playButton.layer.cornerRadius = 10
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        let playButtonConstraints: [NSLayoutConstraint] = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 60),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -60),
            playButton.topAnchor.constraint(equalTo: centerYAnchor, constant: 100),
            playButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        
        // Settings Button
        
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        settingsButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        settingsButton.layer.cornerRadius = 10
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        let settingsButtonConstraints: [NSLayoutConstraint] = [
            settingsButton.trailingAnchor.constraint(equalTo: playButton.trailingAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: playButton.leadingAnchor),
            settingsButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 15),
            settingsButton.heightAnchor.constraint(equalTo: playButton.heightAnchor)
        ]
        NSLayoutConstraint.activate(settingsButtonConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
