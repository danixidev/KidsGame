import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconReferenceButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
        setScore(score)
    }

    
    func createRandomIcon() -> String {
        let icons = ["✡️", "☸️", "⚛️", "☪️", "☯️", "♒️" ]
        let generatedNumber = Int.random(in: 0...icons.count-1)
        
        return icons[generatedNumber]
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let result = compareText(text1: sender.title(for: .normal)!, text2: iconReferenceButton.title(for: .normal)!)
        
        if result {
            print("The button has been pressed correctly")
            
            // Add a point to the score
            actualizeScore(true)
            
            // Create a new icon
            iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
            
        } else {
            print("The button has been pressed incorrectly")
            
            // Subtract a point to the score
            actualizeScore(false)
            
            // Create a new icon
            iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
        }
    }
    
    func compareText(text1: String, text2: String) -> Bool {
        if text1 == text2 {
            return true
        } else {
            return false
        }
    }
    
    // 'true' to add, 'false' to subtract
    func actualizeScore(_ action: Bool) {
        let points = 1
        
        score += action ? points : -points
        setScore(score)
    }
    
    func setScore(_ score: Int) {
        scoreLabel.text = "\(score) points"
    }
}

