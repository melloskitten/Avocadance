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
    
    // TODO: Bring in the speed!
    // is fallingDownRate probably the same as speed....???
    public var speed: Int = 1
    public var fallingDownRate: Double
    
    public init(dance: Dance, clockRate: Double, scene: GameScene, fallingDownRate: Double) {
        self.dance = dance
        self.clockRate = clockRate
        self.scene = scene
        self.fallingDownRate = fallingDownRate
        self.scene.clockRate = clockRate
    }
    
    // This method is used to start a game.
    public func displayDance() {
        
        // TODO: MISSING: AUDIO NODE STARTING
        
        var zIndex = 500
        
        for i in 0..<dance.components.count {
            for j in 0..<dance.components[i].count {
                
                let waitingTime = Double(j) * clockRate
                let currentRhythm = dance.components[i][j]
                
                if currentRhythm != nil {
                    
                    let wait = SKAction.wait(forDuration: waitingTime)
                    
                    // FIXME: Currently duration and y are set to a specific time.
                    let moveDown = SKAction.moveTo(y: 0-62, duration: fallingDownRate)
                    let sequence = SKAction.sequence([wait, moveDown])
                    
                    // FIXME: Currently having hard coded offset.
                    //let offset = i * 60 + 50
                    //let xOffset = CGFloat(i * Int(floor((550)/4)) + (62+32))
                    let xOffset = CGFloat(i * Int(floor((550)/4)) + 94)
                    let yOffset = CGFloat(775+62)
                    
                    // Display of Tap Rhythm.
                    if currentRhythm is TapRhythm {
                        let tapRhythm = currentRhythm as! TapRhythm
                        let tapRhythmShape = TapRhythmShape(circleOfRadius: 50, x: xOffset, y: yOffset, color: tapRhythm.color)
                        tapRhythmShape.name = "taprhythm\(i)\(j)"
                        zIndex = zIndex - 1
                        tapRhythmShape.zPosition = CGFloat(zIndex)
                        scene.addChild(tapRhythmShape)
                        tapRhythmShape.run(sequence)
                        continue
                    }
                    
                    // Display of Slide Rhythm.
                    // FIXME: Fixed size for slider element
                    if currentRhythm is SliderRhythm {
                        let sliderRhythm = currentRhythm as! SliderRhythm
                        let sliderRhythmShape = SliderRhythmShape(rectOf: CGSize(width: 80, height: 80), x: xOffset, y: yOffset, length: sliderRhythm.length, color: sliderRhythm.color)
                        sliderRhythmShape.name = "sliderhythm\(i)\(j)"
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
