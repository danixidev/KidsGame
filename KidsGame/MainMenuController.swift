import UIKit

class MainMenuController: UIViewController {
    
    var orientations = UIInterfaceOrientationMask.portrait //or what orientation you want
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self.orientations }
        set { self.orientations = newValue }
    }
    
    
    
    @IBOutlet weak var StartGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        StartGameButton.layer.cornerRadius = 6.0
    }
    
    @IBAction func StartGameButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToGame", sender: nil)
    }
}
