import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconReferenceImage: UIButton!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iconReferenceImage.setTitle(createRandomIcon(), for: .normal)
    }

    
    func createRandomIcon() -> String {
        let icons = ["✡️", "☸️", "⚛️", "☪️", "☯️", "♒️" ]
        let generatedNumber = Int.random(in: 0...icons.count-1)
        
        return icons[generatedNumber]
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let result = compareText(text1: sender.title(for: .normal)!, text2: iconReferenceImage.title(for: .normal)!)
        
        if(result) {
            print("ha pulsado el boton bien")
        } else {
            print("Ha pulsado el boton mal")
        }
    }
    
    func compareText(text1: String, text2: String) -> Bool {
        if text1 == text2 {
            return true
        } else {
            return false
        }
    }
    
    func actualizeScore() {
        
    }
    
}

