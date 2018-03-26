import PlaygroundSupport
import UIKit
import SpriteKit

// The introductory screen presented on the first page.
public class IntroScene: SKScene {
    
    public override func didMove(to: SKView) {
        
        scaleMode = .aspectFill
        
        // Init all sprites.
        let background = SKSpriteNode(imageNamed: BG)
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        
        let logoShape = SKSpriteNode(imageNamed: LOGO)
        logoShape.position = CGPoint(x: (self.view?.center.x)!, y: (self.view?.center.y)!+200)
        
        let mamacat = SKSpriteNode(imageNamed: CAT_1)
        mamacat.position = CGPoint(x: (self.view?.center.x)!+125, y: (self.view?.center.y)!-50)
        
        let penguin = SKSpriteNode(imageNamed: PINGU_1)
        penguin.position = CGPoint(x: (self.view?.center.x)!-125, y: (self.view?.center.y)!-50)
        
        let avocado = SKSpriteNode(imageNamed: AVOCADO_1)
        avocado.position = CGPoint(x: (self.view?.center.x)!, y: (self.view?.center.y)!-100)
        
        addChild(background)
        addChild(mamacat)
        addChild(penguin)
        addChild(avocado)
        addChild(logoShape)
    }
}
