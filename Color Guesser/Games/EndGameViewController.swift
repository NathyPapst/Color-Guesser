import UIKit

class EndGameViewController: UIViewController {
    
    let myView = EndGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        myView.playAgainButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        myView.backButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myView.scoreLabel.attributedText = NSAttributedString(
            string: String(myView.score),
            attributes: [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 80, weight: .bold)
            ])
    }
    
    @objc func changeViewController(_ sender: UIButton!) {
        switch sender {
            case myView.playAgainButton:
                navigationController?.pushViewController(HueGameViewController(), animated: true)
            case myView.backButton:
                navigationController?.popToViewController(ofClass: ModeSelectViewController.self, animated: true)
            default:
                return
        }
    }
}
