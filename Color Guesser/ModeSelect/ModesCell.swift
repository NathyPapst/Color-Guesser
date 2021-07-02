import UIKit

class ModesCell: UICollectionViewCell {
    
    let modeButton = UIButton()
    let modeLabel = UILabel()
    var modesData: ModesData? {
        didSet {
            guard let modesData = modesData else { return }
            modeButton.tag = modesData.tag
            let background = UIImageView(image: modesData.image)
            contentView.addSubview(background)
            background.clipsToBounds = true
            background.layer.cornerRadius = 20
            background.contentMode = .scaleAspectFill
            background.translatesAutoresizingMaskIntoConstraints = false
            let backgroundConstraints: [NSLayoutConstraint] = [
                background.topAnchor.constraint(equalTo: contentView.topAnchor),
                background.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                background.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                background.heightAnchor.constraint(equalTo: contentView.heightAnchor)
            ]
            NSLayoutConstraint.activate(backgroundConstraints)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(modeButton)
        
        modeButton.translatesAutoresizingMaskIntoConstraints = false
        let backgroundConstraints: [NSLayoutConstraint] = [
            modeButton.topAnchor.constraint(equalTo: topAnchor),
            modeButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            modeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            modeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
