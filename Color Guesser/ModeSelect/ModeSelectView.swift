import UIKit

struct ModesData {
    var tag: Int
    var label: String
    var image: UIImage!
}

class ModeSelectView: UIView {
    
    let modeSelectLabel = UILabel()
    let modeSelectLabelStroke = UILabel()
    let modesData = [
        ModesData(tag: 0, label: "HUE", image: UIImage(named: "hue")),
        ModesData(tag: 1, label: "SATURATION", image: UIImage(named: "sat")),
        ModesData(tag: 2, label: "BRIGHTNESS", image: UIImage(named: "bright"))
    ]
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ModesCell.self, forCellWithReuseIdentifier: "cell")
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    let backButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setBackground(image: UIImage(named: "Background")!)
        
        addSubview(modeSelectLabelStroke)
        addSubview(modeSelectLabel)
        addSubview(collectionView)
        addSubview(backButton)
        
        // Mode Select Label
        
        modeSelectLabel.attributedText = NSAttributedString(
            string: " Mode Select ",
            attributes: [
                .foregroundColor: UIColor.white,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 50) as Any
            ])
        modeSelectLabelStroke.attributedText = NSAttributedString(
            string: " Mode Select ",
            attributes: [
                .strokeColor: UIColor.black,
                .strokeWidth: 16,
                .kern: 0,
                .font: UIFont(name: "Shrikhand-Regular", size: 50) as Any
            ])
        modeSelectLabel.translatesAutoresizingMaskIntoConstraints = false
        modeSelectLabelStroke.translatesAutoresizingMaskIntoConstraints = false
        let settingsLabelConstraints: [NSLayoutConstraint] = [
            modeSelectLabelStroke.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            modeSelectLabelStroke.centerXAnchor.constraint(equalTo: centerXAnchor),
            modeSelectLabel.centerYAnchor.constraint(equalTo: modeSelectLabelStroke.centerYAnchor),
            modeSelectLabel.centerXAnchor.constraint(equalTo: modeSelectLabelStroke.centerXAnchor)
        ]
        NSLayoutConstraint.activate(settingsLabelConstraints)
        
        // Collection View
        
        collectionView.backgroundColor = .clear
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: modeSelectLabel.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -50)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
        
        // Back Button
        
        let backImageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .heavy, scale: .default)
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
        backButton.layer.cornerRadius = 10

        backButton.translatesAutoresizingMaskIntoConstraints = false
        let backButtonConstraints: [NSLayoutConstraint] = [
            backButton.topAnchor.constraint(equalTo: centerYAnchor, constant: 230),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            backButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(backButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
