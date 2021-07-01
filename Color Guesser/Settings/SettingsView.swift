import UIKit

class SettingsView: UIView {
    
    let settingsLabel = UILabel()
    let settingsLabelStroke = UILabel()
    let musicButton = UIButton(type: .system)
    var musicOnImage: UIImage!
    let musicOffImage = UIImage(named: "music.note.slash")
    let musicLabel = UILabel()
    let soundButton = UIButton(type: .system)
    var soundOnImage: UIImage!
    var soundOffImage: UIImage!
    let soundLabel = UILabel()
    let backButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        addSubview(settingsLabelStroke)
        addSubview(settingsLabel)
        addSubview(musicButton)
        addSubview(soundButton)
        addSubview(backButton)
        addSubview(musicLabel)
        addSubview(soundLabel)
        
        // Settings Label
        
        settingsLabel.attributedText = NSAttributedString(
            string: " Settings ",
            attributes: [
                .foregroundColor: UIColor.white,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        settingsLabelStroke.attributedText = NSAttributedString(
            string: " Settings ",
            attributes: [
                .strokeColor: UIColor.black,
                .strokeWidth: 16,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        settingsLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsLabelStroke.translatesAutoresizingMaskIntoConstraints = false
        let settingsLabelConstraints: [NSLayoutConstraint] = [
            settingsLabelStroke.topAnchor.constraint(equalTo: topAnchor,constant: 120),
            settingsLabelStroke.centerXAnchor.constraint(equalTo: centerXAnchor),
            settingsLabel.centerYAnchor.constraint(equalTo: settingsLabelStroke.centerYAnchor),
            settingsLabel.centerXAnchor.constraint(equalTo: settingsLabelStroke.centerXAnchor)
        ]
        NSLayoutConstraint.activate(settingsLabelConstraints)
        
        // Sound Button
        
        let soundOnConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        let soundOffConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        soundOnImage = UIImage(systemName: "speaker.wave.1.fill",withConfiguration: soundOnConfig)
        soundOffImage = UIImage(systemName: "speaker.slash.fill",withConfiguration: soundOffConfig)
        soundButton.imageView?.contentMode = .scaleAspectFit
        soundButton.setImage(SoundController.shared.soundMuted ? soundOffImage : soundOnImage, for: .normal)
        soundButton.tintColor = .white
        soundButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        soundButton.layer.cornerRadius = 16
        
        soundButton.translatesAutoresizingMaskIntoConstraints = false
        let soundButtonConstraints: [NSLayoutConstraint] = [
            soundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            soundButton.centerYAnchor.constraint(equalTo: musicButton.centerYAnchor, constant: -100),
            soundButton.widthAnchor.constraint(equalToConstant: 60),
            soundButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(soundButtonConstraints)
        
        // Sound Label
        
        soundLabel.attributedText = NSAttributedString(
            string: "SOUND",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 25, weight: .bold)
            ])
    
        soundLabel.translatesAutoresizingMaskIntoConstraints = false
        let soundLabelConstraints: [NSLayoutConstraint] = [
            soundLabel.leadingAnchor.constraint(equalTo: soundButton.trailingAnchor, constant: 25),
            soundLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            soundLabel.centerYAnchor.constraint(equalTo: soundButton.centerYAnchor)
        ]
        NSLayoutConstraint.activate(soundLabelConstraints)
        
        // Music Button
        
        let musicOnConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        musicOnImage = UIImage(systemName: "music.note", withConfiguration: musicOnConfig)
        musicButton.imageView?.contentMode = .scaleAspectFit
        musicButton.setImage(SoundController.shared.musicMuted ? musicOffImage : musicOnImage, for: .normal)
        musicButton.tintColor = .white
        musicButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        musicButton.layer.cornerRadius = 16
        
        musicButton.translatesAutoresizingMaskIntoConstraints = false
        let musicButtonConstraints: [NSLayoutConstraint] = [
            musicButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            musicButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            musicButton.widthAnchor.constraint(equalToConstant: 60),
            musicButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(musicButtonConstraints)
        
        // Music label
        
        musicLabel.attributedText = NSAttributedString(
            string: "MUSIC",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 25, weight: .bold)
            ])
    
        musicLabel.translatesAutoresizingMaskIntoConstraints = false
        let musicLabelConstraints: [NSLayoutConstraint] = [
            musicLabel.leadingAnchor.constraint(equalTo: musicButton.trailingAnchor, constant: 25),
            musicLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            musicLabel.centerYAnchor.constraint(equalTo: musicButton.centerYAnchor)
        ]
        NSLayoutConstraint.activate(musicLabelConstraints)
        
        // Back Button
        
        let backImageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy, scale: .default)
        let backImage = UIImage(systemName: "chevron.backward", withConfiguration: backImageConfig)
        backButton.setImage(backImage, for: .normal)
        backButton.setAttributedTitle(NSAttributedString(
                                        string: "BACK",
                                        attributes: [
                                            .font: UIFont.systemFont(ofSize: 20, weight: .heavy),
                                            .foregroundColor: UIColor.white
                                        ]), for: .normal)
        backButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        backButton.tintColor = .white
        backButton.layer.cornerRadius = 15
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let backButtonConstraints: [NSLayoutConstraint] = [
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3),
            backButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3)
        ]
        NSLayoutConstraint.activate(backButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
