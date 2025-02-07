import Foundation
import SpriteKit

/* This class represents a container for the track playing in the current level.
 * The offset adjusts the song so each cadence is playing at the right time
 * when a Rhythm reaches the Rhythm Checker. */
public class MusicTrack {
    public var offset: Double
    public var audioNode: SKAudioNode
    public var sequence: SKAction
    
    public init(offset: Double, fileName: String) {
        // Set offsets and audioNode, deactivate autoplay.
        self.offset = offset
        self.audioNode = SKAudioNode(fileNamed: fileName)
        self.audioNode.autoplayLooped = false
        
        let customWait = SKAction.wait(forDuration: offset)
        let playAudio = SKAction.play()
        // Create sequence that can simply be run when needed.
        self.sequence = SKAction.sequence([customWait, playAudio])
    }
    
    public func startSong() {
        audioNode.run(sequence)
    }
}
