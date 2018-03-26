import Foundation
import SpriteKit

/* This class represents the UIElement corresponding to a TapRythm
 * (A rhythm where the user is supposed to tap his finger.) */
public class TapRhythmShape: SKShapeNode {
    
    convenience init(circleOfRadius: CGFloat, x: CGFloat, y: CGFloat, color: UIColor) {
        self.init(circleOfRadius: circleOfRadius)
        self.position.x = x
        self.position.y = y
        self.fillColor = color
        self.strokeColor = color
    }
}

