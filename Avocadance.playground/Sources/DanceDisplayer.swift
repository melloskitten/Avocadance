import Foundation
import SpriteKit

/* This class is solely focused on displaying the "Dance" datastructure
 * correctly to the screen, using clockRate and speed and the falling down rate
 * of the "RhythmShapes".
 */
public class DanceDisplayer {
    
    public var dance: Dance
    public let scene: GameScene
    public var clockRate: Double
    public var fallingDownRate: Double
    
    public init(dance: Dance, clockRate: Double, scene: GameScene, fallingDownRate: Double) {
        self.dance = dance
        self.clockRate = clockRate
        self.scene = scene
        self.fallingDownRate = fallingDownRate
        self.scene.clockRate = clockRate
    }
    
    // This method is used to start the display of the dance on the screen
    // taking into consideration the clock rate.
    public func displayDance() {
        
        // Adjust zIndex for correct position of overlapping rhythms.
        var zIndex = 500
        
        for i in 0..<dance.components.count {
            for j in 0..<dance.components[i].count {
                
                let waitingTime = Double(j) * clockRate
                let currentRhythm = dance.components[i][j]
                
                if currentRhythm != nil {
                    
                    // Create corresponding wait and move SKAction depending
                    // on "when" exactly the rhythm is located in the timeline.
                    let wait = SKAction.wait(forDuration: waitingTime)
                    let moveDown = SKAction.moveTo(y: FALL_COORDINATE, duration: fallingDownRate)
                    let sequence = SKAction.sequence([wait, moveDown])
                    
                    // Centered offsets for the rhythms to fall correctly
                    // onto the dance panels.
                    let xOffset = CGFloat(i * Int(floor((550)/4)) + 94)
                    let yOffset = CGFloat(775+62)
                    
                    // Display of Tap Rhythm.
                    if let tapRhythm = currentRhythm as? TapRhythm {
                        let tapRhythmShape = TapRhythmShape(circleOfRadius: TAP_RHYTHM_SIZE, x: xOffset, y: yOffset, color: tapRhythm.color)
                        zIndex = zIndex - 1
                        tapRhythmShape.zPosition = CGFloat(zIndex)
                        scene.addChild(tapRhythmShape)
                        tapRhythmShape.run(sequence)
                        continue
                        }
                    
                    // Display of Slide Rhythm.
                    if let sliderRhythm = currentRhythm as? SliderRhythm {
                        let sliderRhythmShape = SliderRhythmShape(rectOf: CGSize(width: SLIDER_RHYTHM_WIDTH, height: SLIDER_RHYTHM_HEIGHT), x: xOffset, y: yOffset, length: sliderRhythm.length, color: sliderRhythm.color)
                        zIndex = zIndex - 1
                        sliderRhythmShape.zPosition = CGFloat(zIndex)
                        scene.addChild(sliderRhythmShape)
                        sliderRhythmShape.run(sequence)
                        continue
                    }
                }
            }
        }
    }
}
