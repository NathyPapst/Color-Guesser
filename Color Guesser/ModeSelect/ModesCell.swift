import UIKit

class ModesCell: UICollectionViewCell {
    
    let modeButton = UIButton()
    var modesData: ModesData? {
        didSet {
            guard let modesData = modesData else { return }
            modeButton.tag = modesData.tag
            modeButton.setImage(modesData.image, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(modeButton)
        
        modeButton.contentMode = .scaleAspectFill
        modeButton.clipsToBounds = true
        modeButton.layer.cornerRadius = 30
        modeButton.adjustsImageWhenHighlighted = false
        
        modeButton.translatesAutoresizingMaskIntoConstraints = false
        let backgroundConstraints: [NSLayoutConstraint] = [
            modeButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            modeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            modeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            modeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
