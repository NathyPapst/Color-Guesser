import UIKit

class ModeSelectViewController: UIViewController {
    
    let myView = ModeSelectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        
        myView.backButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    @objc func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func changeViewController(_ sender: UIButton!) {
        switch sender.tag {
            case 0:
                navigationController?.pushViewController(HueGameViewController(), animated: true)
            case 1:
                // navigationController?.pushViewController(SaturationGameViewController(), animated: true)
                return
            case 2:
                // navigationController?.pushViewController(BrightnessGameViewController(), animated: true)
                return
            default:
                return
        }
    }
}

extension ModeSelectViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myView.collectionView.frame.width*0.75, height: myView.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ModesCell
        cell.modesData = myView.modesData[indexPath.row]
        cell.modeButton.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        return cell
    }
}
