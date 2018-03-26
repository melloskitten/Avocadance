import SpriteKit
import PlaygroundSupport
import Foundation

/* This class handles the GameScene needed for the game elements.
 * It also holds all gesture handlers needed for the interaction with
 * the different RhythmShape types. */
public class GameScene: SKScene {
    
    let pointLabel = SKLabelNode()
    var pointCounter = 0
    var sliderTime = Date()
    var clockRate: Double = 0
    var sliderLength = 0
    var dancerSprites = [SKSpriteNode]()
    
    public override func didMove(to view: SKView) {
        
        // Set up background.
        initBackground()
        
        // Initialise the Rhythm Checkers.
        initRhythmCheckerBar(numberOfDanceLines: NUM_OF_LINES)
        
        // Initialise point label.
        initPointLabel()
        
        // Add the Tap Gesture Recognizers.
        initGestureRecognizer()
    }
    

    // This function sets the nodes used in the current level.
    func setDancerNodes(dancerNodes: [SKSpriteNode]) {
        
        // Remove previous children
        for node in dancerSprites {
            node.removeFromParent()
        }
        
        // Add new ones
        dancerSprites = dancerNodes
        for node in dancerSprites {
            addChild(node)
            node.position.x = frame.size.width / 2
            node.position.y = 500
            node.isHidden = true
        }
        
        // Display the base move
        dancerSprites[0].isHidden = false

    }
    
    func initBackground() {
        let background = SKSpriteNode(imageNamed: "dark_bg_with_stars.png")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.zPosition = -1000
        addChild(background)
        scaleMode = .aspectFill
    }
    
    func initPointLabel() {
        // Loading in custom font.
        // SOURCE: https://stackoverflow.com/questions/27472692/custom-fonts-in-xcode-playground
        let cfURL = Bundle.main.url(forResource: "04b", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

        pointLabel.text = "0"
        pointLabel.fontSize = 20
        pointLabel.fontName = "04b"
        pointLabel.position = CGPoint(x: frame.size.width / 2, y: 740)
        pointLabel.color = .white
        addChild(pointLabel)
    }
    
    
    func initGestureRecognizer() {
        // Add Tap Recognizer.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(_:)))
        self.view?.addGestureRecognizer(tapGestureRecognizer)
        
        // Add Long Press Recognizer.
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressHandler(_:)))
        longPressRecognizer.minimumPressDuration = 0.2
        self.view?.addGestureRecognizer(longPressRecognizer)
    }
    
    
    @IBAction func longPressHandler(_ gestureRecognizer : UIGestureRecognizer) {
        if gestureRecognizer.state == .began {
            self.sliderTime = Date.init()
            // Call the other point giving method
            pointsForSliderBegin(gestureRecognizer)
        }
        if gestureRecognizer.state == .ended {
            let interval = (Date.init()).timeIntervalSince(sliderTime)
            // calculate points
            pointsForSlider(timeInterval: interval, gestureRecognizer)
        }
    }
    
    @IBAction func tapHandler(_ gestureRecognizer : UIGestureRecognizer) {
        pointsForTap(gestureRecognizer)
    }
    
    // Returns all nodes that are intersecting at a specific point
    // given by the gesture recognizers.
    func getIntersectingNodes(gestureRecognizer: UIGestureRecognizer) -> [SKNode] {
        let fromTranslation = gestureRecognizer.location(in: self.view)
        let translation = self.convertPoint(fromView: fromTranslation)
        //print(nodes(at: translation))
        return nodes(at: translation)
    }
    
    // Method that calculates points given on whether the slider move
    // ended at the "right" time.
    func pointsForSlider(timeInterval: TimeInterval, _ gestureRecognizer: UIGestureRecognizer) {
        
        let intersectingNodes = getIntersectingNodes(gestureRecognizer: gestureRecognizer)
        
        if sliderRhythmWasTapped(nodes: intersectingNodes) {
            
            // Animate the Dance.
            animateDancer()
            
            let referenceValue = clockRate * Double(sliderLength - 1)
            let deviation = abs(referenceValue - timeInterval)
            let point = Int(10 * ((1/(1+deviation))))
            //print(referenceValue)
            //print(deviation)
            updatePoints(point: point)
        }
    }
    
    // Method that calculates points given on whether the user
    // started the slider move at the correct time.
    func pointsForSliderBegin(_ gestureRecognizer: UIGestureRecognizer) {
        
        let intersectingNodes = getIntersectingNodes(gestureRecognizer: gestureRecognizer)
        
        //print("got here")
        //print(intersectingNodes)
        if sliderRhythmWasTapped(nodes: intersectingNodes){
            
            // Animate the Dance.
            animateDancer()

            // Set the sliderLength so we can calculate the points for the sliding part.
            let sliderRhythm = (intersectingNodes.first(where: { (node) -> Bool in
                if node is SliderRhythmShape {
                    return true
                }
                return false
            })) as! SliderRhythmShape
            self.sliderLength = sliderRhythm.length
            
            // Calculate points.
            let point = calculatePoints(intersectingNodes: intersectingNodes, penalty: TAP_PENALTY, maxPoints: MAX_POINTS)

            // Display points.
            updatePoints(point: point)
        }
    }
    
    // Method that calculates points given on whether the user
    // started the tap at the correct time.
    func pointsForTap(_ gestureRecognizer: UIGestureRecognizer) {
        
        let intersectingNodes = getIntersectingNodes(gestureRecognizer: gestureRecognizer)
        if rhythmWasTapped(nodes: intersectingNodes) {
            
            // Animate the Dance.
            animateDancer()
            
            // Calculate points.
            let point = calculatePoints(intersectingNodes: intersectingNodes, penalty: TAP_PENALTY, maxPoints: MAX_POINTS)
            
            // Display points.
            updatePoints(point: point)
        }
    }
    
    // Animates the next dance move
        func animateDancer() {
        var rand = (Int(arc4random_uniform(UInt32(4))))
        var previous = 0
        
        for i in 0..<dancerSprites.count {
            
            if dancerSprites[i].isHidden == false {
                previous = i
            }
            
            dancerSprites[i].isHidden = true
        }
        
        if previous == rand {
            rand = (rand + 1) % 5
        }
        
        dancerSprites[rand].isHidden = false
        
    }
    
    func updatePoints(point: Int) {
        pointCounter += point
        pointLabel.text = "\(pointCounter)"
    }
    
    func calculatePoints(intersectingNodes: [SKNode], penalty: CGFloat, maxPoints: CGFloat) -> Int {
        // Calculate the center of the SKNodes, then compare the middle points.
        let firstPoint = self.convertPoint(fromView: intersectingNodes[0].position)
        let secondPoint = self.convertPoint(fromView: intersectingNodes[1].position)
        
        // Calculate mean squared distance.
        let distance = abs(firstPoint.y-secondPoint.y) * penalty
        
        // Calculate points.
        let point = Int(maxPoints * ((1/(1+distance))))
        return point
    }
    
    func rhythmWasTapped(nodes: [SKNode]) -> Bool {
        let containsRhythmChecker = nodes.contains { (node) -> Bool in
            if node is RhythmChecker {
                return true
            }
            return false
        }
        let containsRhythm = nodes.contains { (node) -> Bool in
            if node is TapRhythmShape {
                return true
            }
            return false
        }
        return containsRhythm && containsRhythmChecker
    }
    
    func sliderRhythmWasTapped(nodes: [SKNode]) -> Bool {
        let containsRhythmChecker = nodes.contains { (node) -> Bool in
            if node is RhythmChecker {
                return true
            }
            return false
        }
        let containsSliderRhythm = nodes.contains { (node) -> Bool in
            if node is SliderRhythmShape {
                return true
            }
            return false
        }
        return containsSliderRhythm && containsRhythmChecker
    }
    
    // Generates the bar with the dance panels and their corresponding positions.
    func initRhythmCheckerBar(numberOfDanceLines: Int) {
        var zIndex = -999
        for i in 0..<numberOfDanceLines {
            
            let xOffset = CGFloat(i * Int(floor((550)/4)) + 94)
            let yOffset = CGFloat(150)
            let rhythmChecker = RhythmChecker(imageNamed: "dance_panel.png", x: xOffset, y: yOffset)
            rhythmChecker.zPosition = CGFloat(zIndex)
            zIndex = zIndex + 1
            addChild(rhythmChecker)
        }
    }
    
}
