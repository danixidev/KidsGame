import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconReferenceButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!

    
    var score = 0
    var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        
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
            
            // Rearrange buttons
            randomizeButtons()
            
        } else {
            print("The button has been pressed incorrectly")
            
            // Subtract a point to the score
            actualizeScore(false)
            
            // Create a new icon
            iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
            
            // Rearrange buttons
            randomizeButtons()
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
    
    
    func randomizeButtons() {
        var icons = ["✡️", "☸️", "⚛️", "☪️", "☯️", "♒️" ]
        
        if icons.count == buttons.count {
            for button in buttons {
                // Generate random number to select icon
                let generatedNumber = Int.random(in: 0...icons.count-1)
                
                // Set the icon
                button.setTitle(icons[generatedNumber], for: .normal)
                
                // Delete the icon from the array
                icons.remove(at: generatedNumber)
            }
        } else {
            print("icons' and buttons' length doesnt match [randomizeButtons()]")
        }
    }
}

