import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconReferenceButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var score = 0
    var buttons: [UIButton] = []
    var secondsRemaining = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add all buttons to a single array to simplify the code on the randomisation of buttons
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        
        iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
        setScore(score)
        
        NotificationCenter.default.addObserver(self, selector: #selector(startGameNotif), name: Notification.Name("startGame"), object: nil)
        startGame()
    }

    // Creates a random icon from the array, and returns it
    func createRandomIcon() -> String {
        let icons = ["✡️", "☸️", "⚛️", "☪️", "☯️", "♒️", "♈️", "⛎", "♓️"]
        let generatedNumber = Int.random(in: 0...icons.count-1)
        
        return icons[generatedNumber]
    }

    // Generic function for a button press
    @IBAction func buttonPressed(_ sender: UIButton) {
        // Compares the text between the button and the reference
        let result = compareText(text1: sender.title(for: .normal)!, text2: iconReferenceButton.title(for: .normal)!)
        
        if result {
            print("The button has been pressed correctly")
            
            // Add a point to the score
            actualizeScore(true)
            
        } else {
            print("The button has been pressed incorrectly")
            
            // Subtract a point to the score
            actualizeScore(false)
            
        }
        
        // Create a new icon
        iconReferenceButton.setTitle(createRandomIcon(), for: .normal)
        
        // Rearrange buttons
        randomizeButtons()
    }
    
    
    // Compares two strings, returns true if they match, false if they dont match
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
        
        score += action ? points : -points  // if action is true it adds points, if false it subtracts them
        setScore(score)
    }
    
    // Parses the score to show points at the end of it
    // This is used to simplify code
    func setScore(_ score: Int) {
        scoreLabel.text = "\(score) points"
    }
    
    // Rearranges the buttons randomly
    func randomizeButtons() {
        var icons = ["✡️", "☸️", "⚛️", "☪️", "☯️", "♒️", "♈️", "⛎", "♓️"]
        
        if icons.count == buttons.count { // If the amount matches it continues
            for button in buttons {
                // Generate random number to select icon
                let generatedNumber = Int.random(in: 0...icons.count-1)
                
                // Set the icon
                button.setTitle(icons[generatedNumber], for: .normal)
                
                // Delete the icon from the array
                icons.remove(at: generatedNumber)
            }
        } else {
            // Shows error message if it doesnt match, to prevent crashes
            print("icons' and buttons' length doesnt match [randomizeButtons()]")
        }
    }
    
        
    func startTimer(_ label: UILabel!) {
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
                label.text = "\(self.secondsRemaining) seconds"
            } else {
                Timer.invalidate()
                self.goToFinish()
            }
        }
                
    }
    
    
    
    func goToFinish() {
        performSegue(withIdentifier: "goToFinish", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FinishController
        destination.score = score
    }
    
    
    @objc func startGameNotif(notification: NSNotification) {
        startGame()
    }
    
    func startGame() {
        score = 0
        setScore(score)
        secondsRemaining = 30
        startTimer(secondsLabel)
    }
}

