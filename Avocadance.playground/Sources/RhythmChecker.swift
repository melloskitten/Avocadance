import Foundation
import SpriteKit

/* This class represents the UIElements at which the user is supposed to tap
 * when the rhythm has arrived at the correct time. */
public class RhythmChecker: SKSpriteNode {
    
    public convenience init(imageNamed: String, x: CGFloat, y: CGFloat) {
        self.init(imageNamed: imageNamed)
        self.position.x = x
        self.position.y = y
    }
}
