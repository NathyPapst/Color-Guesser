import UIKit

class EndGameView: UIView {
    
    let modeCompleteLabel = UILabel()
    let modeCompleteStrokeLabel = UILabel()
    let scoreTextLabel = UILabel()
    let scoreLabel = UILabel()
    let colorFactView = ColorFactView()
    let playAgainButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    var score: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        addSubview(modeCompleteStrokeLabel)
        addSubview(modeCompleteLabel)
        addSubview(scoreTextLabel)
        addSubview(scoreLabel)
        addSubview(colorFactView)
        addSubview(playAgainButton)
        addSubview(backButton)
        
        // Mode Select Label
        
        modeCompleteLabel.attributedText = NSAttributedString(
            string: " Mode Complete! ",
            attributes: [
                .foregroundColor: UIColor.white,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        modeCompleteStrokeLabel.attributedText = NSAttributedString(
            string: " Mode Complete! ",
            attributes: [
                .strokeColor: UIColor.black,
                .strokeWidth: 16,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 40) as Any
            ])
        modeCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        modeCompleteStrokeLabel.translatesAutoresizingMaskIntoConstraints = false
        let settingsLabelConstraints: [NSLayoutConstraint] = [
            modeCompleteStrokeLabel.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            modeCompleteStrokeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            modeCompleteLabel.centerYAnchor.constraint(equalTo: modeCompleteStrokeLabel.centerYAnchor),
            modeCompleteLabel.centerXAnchor.constraint(equalTo: modeCompleteStrokeLabel.centerXAnchor)
        ]
        NSLayoutConstraint.activate(settingsLabelConstraints)
        
        // Score Text Label
        
        scoreTextLabel.attributedText = NSAttributedString(
            string: "YOUR SCORE",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 30, weight: .bold)
            ])
        scoreTextLabel.translatesAutoresizingMaskIntoConstraints = false
        let scoreTextLabelConstraints: [NSLayoutConstraint] = [
            scoreTextLabel.topAnchor.constraint(equalTo: modeCompleteLabel.bottomAnchor, constant: 50),
            scoreTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        NSLayoutConstraint.activate(scoreTextLabelConstraints)
        
        // Score Label
        
        scoreLabel.attributedText = NSAttributedString(
            string: String(score),
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 80, weight: .bold)
            ])
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        let scoreLabelConstraints: [NSLayoutConstraint] = [
            scoreLabel.topAnchor.constraint(equalTo: scoreTextLabel.bottomAnchor, constant: 10),
            scoreLabel.centerXAnchor.constraint(equalTo: scoreTextLabel.centerXAnchor)
        ]
        NSLayoutConstraint.activate(scoreLabelConstraints)
        
        // Color Fact
        
        colorFactView.translatesAutoresizingMaskIntoConstraints = false
        let colorFactViewConstraints: [NSLayoutConstraint] = [
            colorFactView.topAnchor.constraint(equalTo: modeCompleteLabel.bottomAnchor, constant: 240),
            colorFactView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            colorFactView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            colorFactView.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(colorFactViewConstraints)
        
        // Back Button
        
        backButton.setTitle("BACK", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        backButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        backButton.layer.cornerRadius = 16
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        let backButtonConstraints: [NSLayoutConstraint] = [
            backButton.trailingAnchor.constraint(equalTo: playAgainButton.trailingAnchor),
            backButton.leadingAnchor.constraint(equalTo: playAgainButton.leadingAnchor),
            backButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            backButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3)
        ]
        NSLayoutConstraint.activate(backButtonConstraints)
        
        // Play Again Button
        
        playAgainButton.setTitle("PLAY AGAIN", for: .normal)
        playAgainButton.setTitleColor(.white, for: .normal)
        playAgainButton.backgroundColor = UIColor(white: 0.5, alpha: 1)
        playAgainButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
        playAgainButton.layer.cornerRadius = 16
        
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        let playAgainButtonConstraints: [NSLayoutConstraint] = [
            playAgainButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            playAgainButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            playAgainButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),
            playAgainButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2/3)
        ]
        NSLayoutConstraint.activate(playAgainButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
