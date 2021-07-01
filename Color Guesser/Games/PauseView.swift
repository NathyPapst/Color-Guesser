import UIKit

class PauseView: UIView {
    
    let pauseLabel = UILabel()
    let pauseStrokeLabel = UILabel()
    let resumeButton = UIButton(type: .system)
    let restartButton = UIButton(type: .system)
    let quitButton = UIButton(type: .system)
    let soundButton = UIButton(type: .system)
    var soundOnImage: UIImage!
    var soundOffImage: UIImage!
    let musicButton = UIButton(type: .system)
    var musicOnImage: UIImage!
    let musicOffImage = UIImage(named: "music.note.slash")
    let container = UIView()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        addSubview(container)
        container.addSubview(pauseStrokeLabel)
        container.addSubview(pauseLabel)
        container.addSubview(resumeButton)
//        container.addSubview(restartButton)
        container.addSubview(quitButton)
        container.addSubview(musicButton)
        container.addSubview(soundButton)
        
        // Container
        
        container.backgroundColor = .gray
        container.layer.cornerRadius = 24
        container.translatesAutoresizingMaskIntoConstraints = false
        let containerConstraints: [NSLayoutConstraint] = [
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ]
        NSLayoutConstraint.activate(containerConstraints)
        
        // Pause Label
        
        pauseLabel.attributedText = NSAttributedString(
            string: " Paused ",
            attributes: [
                .foregroundColor: UIColor.white,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        pauseStrokeLabel.attributedText = NSAttributedString(
            string: " Paused ",
            attributes: [
                .strokeColor: UIColor.black,
                .strokeWidth: 16,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        pauseLabel.translatesAutoresizingMaskIntoConstraints = false
        pauseStrokeLabel.translatesAutoresizingMaskIntoConstraints = false
        let pauseLabelConstraints: [NSLayoutConstraint] = [
            pauseStrokeLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 40),
            pauseStrokeLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            pauseLabel.centerYAnchor.constraint(equalTo: pauseStrokeLabel.centerYAnchor),
            pauseLabel.centerXAnchor.constraint(equalTo: pauseStrokeLabel.centerXAnchor)
        ]
        NSLayoutConstraint.activate(pauseLabelConstraints)
        
        // Resume Button
        
        resumeButton.setTitle("RESUME", for: .normal)
        resumeButton.setTitleColor(.white, for: .normal)
        resumeButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
        resumeButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        resumeButton.layer.cornerRadius = 16
        
        resumeButton.translatesAutoresizingMaskIntoConstraints = false
        let resumeButtonConstraints: [NSLayoutConstraint] = [
            resumeButton.topAnchor.constraint(equalTo: pauseLabel.bottomAnchor, constant: 50),
            resumeButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3),
            resumeButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 50),
            resumeButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(resumeButtonConstraints)
        
        // Restart Button
        
//        restartButton.setTitle("RESTART", for: .normal)
//        restartButton.setTitleColor(.white, for: .normal)
//        restartButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
//        restartButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
//        restartButton.layer.cornerRadius = 15
//
//        restartButton.translatesAutoresizingMaskIntoConstraints = false
//        let restartButtonConstraints: [NSLayoutConstraint] = [
//            restartButton.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: 16),
//            restartButton.heightAnchor.constraint(equalTo: resumeButton.heightAnchor),
//            restartButton.leadingAnchor.constraint(equalTo: resumeButton.leadingAnchor),
//            restartButton.trailingAnchor.constraint(equalTo: resumeButton.trailingAnchor)
//        ]
//        NSLayoutConstraint.activate(restartButtonConstraints)
        
        // Quit Button
        
        quitButton.setTitle("QUIT", for: .normal)
        quitButton.setTitleColor(.white, for: .normal)
        quitButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
        quitButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        quitButton.layer.cornerRadius = 16
                
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        let exitButtonConstraints: [NSLayoutConstraint] = [
            quitButton.topAnchor.constraint(equalTo: resumeButton.bottomAnchor, constant: 16),
            quitButton.heightAnchor.constraint(equalTo: resumeButton.heightAnchor),
            quitButton.leadingAnchor.constraint(equalTo: resumeButton.leadingAnchor),
            quitButton.trailingAnchor.constraint(equalTo: resumeButton.trailingAnchor)
        ]
        NSLayoutConstraint.activate(exitButtonConstraints)
        
        // pauseMusicButton
        
        let musicOnConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        musicOnImage = UIImage(systemName: "music.note", withConfiguration: musicOnConfig)
        musicButton.imageView?.contentMode = .scaleAspectFit
        musicButton.setImage(SoundController.shared.musicMuted ? musicOffImage : musicOnImage, for: .normal)
        musicButton.tintColor = .white
        musicButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
        musicButton.layer.cornerRadius = 16
        
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        let musicButtonConstraints: [NSLayoutConstraint] = [
            musicButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            musicButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            musicButton.widthAnchor.constraint(equalToConstant: 60),
            musicButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(musicButtonConstraints)
        
        // soundButton
        
        let soundOnConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        let soundOffConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        soundOnImage = UIImage(systemName: "speaker.wave.1.fill",withConfiguration: soundOnConfig)
        soundOffImage = UIImage(systemName: "speaker.slash.fill",withConfiguration: soundOffConfig)
        soundButton.imageView?.contentMode = .scaleAspectFit
        soundButton.setImage(SoundController.shared.soundMuted ? soundOffImage : soundOnImage, for: .normal)
        soundButton.tintColor = .white
        soundButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
        soundButton.layer.cornerRadius = 16
        
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        let soundButtonConstraints: [NSLayoutConstraint] = [
            soundButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            soundButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50),
            soundButton.widthAnchor.constraint(equalToConstant: 60),
            soundButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(soundButtonConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
