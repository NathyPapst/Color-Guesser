import UIKit

class MenuViewController: UIViewController {
    
    let myView = MenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        myView.playButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        
        myView.settingsButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
    }
    
    @objc func changeViewController(_ sender: UIButton!) {
        switch sender {
            case myView.playButton:
                navigationController?.pushViewController(ModeSelectViewController(), animated: true)
            case myView.settingsButton:
                navigationController?.pushViewController(SettingsViewController(), animated: true)
            default:
                return
        }
    }
}
