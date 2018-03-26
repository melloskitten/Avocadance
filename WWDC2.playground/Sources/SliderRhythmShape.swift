import Foundation
import SpriteKit
import UIKit

/* This class represents the UIElement corresponding to a SliderRhythm
 * (A rhythm where the user is supposed to hold his finger longer.)
 * The sliderLength tells, how many regular rhythms fit inside the Slider. */
public class SliderRhythmShape: SKShapeNode {
    
    var length = 0
    
    convenience init(rectOf: CGSize, x: CGFloat, y: CGFloat, length: Int, color: UIColor) {
        self.init(rectOf: rectOf)
        self.position.x = x
        self.position.y = y
        self.fillColor = color
        self.strokeColor = color
        self.length = length
    }
    
}
