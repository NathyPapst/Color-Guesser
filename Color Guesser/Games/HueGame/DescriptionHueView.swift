import UIKit

class DescriptionHueView: UIView {
    
//    let hueModeLabel = UILabel()
//    let hueModeLabelStroke = UILabel()
    let hueModeDescription = UILabel()
    let tapToContinueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(white: 0, alpha: 0.875)
        
//        addSubview(hueModeLabelStroke)
//        addSubview(hueModeLabel)
        addSubview(hueModeDescription)
        addSubview(tapToContinueLabel)
        
        // Hue Mode Label
        
//        hueModeLabel.attributedText = NSAttributedString(
//            string: " Hue Mode ",
//            attributes: [
//                .foregroundColor: UIColor.white,
//                .kern: 0,
//                .font: UIFont(name: "Shrikhand-Regular", size: 50) as Any
//            ])
//        hueModeLabelStroke.attributedText = NSAttributedString(
//            string: " Hue Mode ",
//            attributes: [
//                .strokeColor: UIColor.black,
//                .strokeWidth: 16,
//                .kern: 0,
//                .font: UIFont(name: "Shrikhand-Regular", size: 50) as Any
//            ])
//        hueModeLabel.translatesAutoresizingMaskIntoConstraints = false
//        hueModeLabelStroke.translatesAutoresizingMaskIntoConstraints = false
//        let hueModeLabelConstraints: [NSLayoutConstraint] = [
//        hueModeLabelStroke.topAnchor.constraint(equalTo: topAnchor,constant: 250),
//        hueModeLabelStroke.centerXAnchor.constraint(equalTo: centerXAnchor),
//        hueModeLabel.centerYAnchor.constraint(equalTo: hueModeLabelStroke.centerYAnchor),
//        hueModeLabel.centerXAnchor.constraint(equalTo: hueModeLabelStroke.centerXAnchor)
//        ]
//        NSLayoutConstraint.activate(hueModeLabelConstraints)
        
        // Hue Description
        
        hueModeDescription.attributedText = NSAttributedString(
            string: "FIND THE CORRECT HUE",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 35, weight: .bold)
            ])
        hueModeDescription.textAlignment = .center
        hueModeDescription.numberOfLines = 0
        hueModeDescription.translatesAutoresizingMaskIntoConstraints = false
        let hueDescriptionConstraints: [NSLayoutConstraint] = [
            hueModeDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            hueModeDescription.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            hueModeDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ]
        NSLayoutConstraint.activate(hueDescriptionConstraints)
        
        // Tap To Continue Label
        
        tapToContinueLabel.attributedText = NSAttributedString(
            string: "Tap to continue",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 20, weight: .regular)
            ])
        tapToContinueLabel.backgroundColor = .clear
        tapToContinueLabel.textAlignment = .center
        tapToContinueLabel.translatesAutoresizingMaskIntoConstraints = false
        let tapToContinueLabelConstraints: [NSLayoutConstraint] = [
            tapToContinueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tapToContinueLabel.topAnchor.constraint(equalTo: hueModeDescription.bottomAnchor, constant: 110)
        ]
        NSLayoutConstraint.activate(tapToContinueLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
}
