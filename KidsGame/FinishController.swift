import UIKit

class FinishController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var popupView: UIView!
    
    
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true       // Makes view non-dismissable
        
        view.isOpaque = false
        view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dismissButton.layer.cornerRadius = 6.0
        popupView.layer.cornerRadius = 10.0
        
        titleLabel.text = String(describing: score!)
    }
    
    
    @IBAction func DismissButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("startGame"), object: nil)
        dismiss(animated: true, completion: nil)
    }
}
