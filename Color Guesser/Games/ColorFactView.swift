import UIKit

class ColorFactView: UIView {
    
    let colorFactLabel = UILabel()
    let factLabel = UITextView()
    let colorFacts: [String] = [
        "The intensity determines the presence of brightness in the color and can be considered weak or strong.",
        "There are three parameters that are used to define a color: hue, saturation and brightness.",
        "Colors can be light or dark, this classification depends on the brightness.",
        "Intensity refers to the degree of purity of a color. A highly intense color is bright and a low intensity color is more neutral.",
        "Color theory serves to understand the way colors are and how they complement each other.",
        "According to a study, the color most loved by people is blue, and the most hated is brown.",
        "Each color can relate to a human feeling, such as the color yellow makes us feel hungry.",
        "Chromophobia is the phobia or fear of colors.",
        "The animal capable of seeing the greatest variety of colors is the 'praying mantis shrimp'.",
        "The first color that people can perceive is the color red.",
        "Women can distinguish more colors than men.",
        "Color psychology is a study that investigates how the human brain recognizes existing colors and transforms them into emotions or sensations. It's linked to color theory.",
        "The color orange is called that precisely because of the orange fruit. Until its arrival on the European continent, there was no word to designate this color.",
        "The rainbow is composed of seven colors, in this order: red, orange, yellow, green, blue, indigo and violet.",
        "A person with normal vision sees about 30,000 colors."
    ]
    let highlight: [String] = [
        "intensity",
        "hue, saturation and brightness",
        "light or dark",
        "purity of a color",
        "Color theory",
        "blue",
        "hungry",
        "Chromophobia",
        "praying mantis shrimp",
        "red.",
        "Women",
        "Color psychology",
        "orange",
        "rainbow",
        "30,000 colors"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = UIColor(white: 0.25, alpha: 1)
        layer.cornerRadius = 16
        
        addSubview(colorFactLabel)
        addSubview(factLabel)
        
        // Color Fact Label
        
        colorFactLabel.attributedText = NSAttributedString(
            string: "COLOR FACT",
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 25, weight: .heavy)
            ])
        colorFactLabel.textAlignment = .center
        
        colorFactLabel.translatesAutoresizingMaskIntoConstraints = false
        let colorFactLabelConstraints: [NSLayoutConstraint] = [
            colorFactLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorFactLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
        ]
        NSLayoutConstraint.activate(colorFactLabelConstraints)
        
        // Fact Text
        let factNumber = Int.random(in: 0..<colorFacts.count)
        let attrString = NSMutableAttributedString(
            string: colorFacts[factNumber],
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 20, weight: .light)
            ])
        attrString.addAttribute(.font, value: UIFont.systemFont(ofSize: 20, weight: .bold), range: (attrString.string as NSString).range(of: highlight[factNumber]))
        factLabel.attributedText = attrString
        factLabel.textAlignment = .center
        factLabel.backgroundColor = .clear
        factLabel.isEditable = false
        factLabel.isSelectable = false
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        let factLabelConstraints: [NSLayoutConstraint] = [
            factLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            factLabel.topAnchor.constraint(equalTo: colorFactLabel.bottomAnchor),
            factLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            factLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            factLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(factLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
