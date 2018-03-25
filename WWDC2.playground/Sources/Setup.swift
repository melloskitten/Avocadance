import PlaygroundSupport
import Foundation
import SpriteKit

public enum PredefinedDance {
    case twinkletwinkle
}

public class Setup {
    
    public static func initIntroScene() -> SKView {
        let introScene = IntroScene(size: CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        let view = SKView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        view.presentScene(introScene)
        return view
    }
    
    public static func startGame(withDancer dancer: Dancer) -> SKView {
        
        // SETTING UP SCENE
        let gameView = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 775))
        let gameScene = GameScene(size: CGSize(width: 600, height: 775))
        gameView.presentScene(gameScene)
        
        // SET UP DANCE
        let predefinedDance = PredefinedDance.twinkletwinkle
        let dance = initDance(predefinedDance: predefinedDance)
        
        // INIT DANCE DISPLAYER & display it!
        // FIXME: Hardcoded values!
        let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.5, gameScene: gameScene, fallingDownRate: 6)
        danceDisplayer.displayDance()
        
        // TODO: INIT MUSIC
        initMusic(gameScene: gameScene, offset: 4.72, fileName: "TwinkleTwinkle.m4a")
        
        // SET UP DANCER
        initDancer(dancer: dancer, gameScene: gameScene)
        
        return gameView
        
    }
    
    
    public static func startGame(withSong: Song) -> SKView {
        
        // SETTING UP SCENE
        let gameView = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 775))
        let gameScene = GameScene(size: CGSize(width: 600, height: 775))
        gameView.presentScene(gameScene)
        
        // SET UP DANCE
        let dance = initDance(preDefinedSong: withSong)
        
        // INIT DANCE DISPLAYER & display it!
        // FIXME: Hardcoded values!
        //var clockRate = (1/110) * 60
        switch withSong {
        case .odeToJoy:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .minuet:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.5, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .turkishMarch_1:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .turkishMarch_2:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        }

        
        //// TODO: INIT MUSIC
        //initMusic(gameScene: gameScene, offset: 4.72, fileName: "ode_to_joy.m4a")
        
        switch withSong {
        case .odeToJoy:
            initMusic(gameScene: gameScene, offset: 4.72, fileName: "ode_to_joy.m4a")
        case .minuet:
            initMusic(gameScene: gameScene, offset: 4.72, fileName: "minuet.m4a")
        case .turkishMarch_1:
            initMusic(gameScene: gameScene, offset: 4.60, fileName: "turkish_march_1.m4a")
        case .turkishMarch_2:
            initMusic(gameScene: gameScene, offset: 4.50, fileName: "turkish_march_2.m4a")
        }
        
        // SET UP DANCER
        initDancer(dancer: Dancer.avocado, gameScene: gameScene)
        
        return gameView
        
        
    }
    
    public static func startGame(withDance dance: Dance, withSong song: Song, withDancer dancer: Dancer) -> SKView {
        
        
        // SETTING UP SCENE
        let gameView = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 775))
        let gameScene = GameScene(size: CGSize(width: 600, height: 775))
        gameView.presentScene(gameScene)
        
        // INIT DANCE DISPLAYER & display it!
        // FIXME: Hardcoded values!
        //var clockRate = (1/110) * 60
        switch song {
        case .odeToJoy:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .minuet:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.5, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .turkishMarch_1:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        case .turkishMarch_2:
            let danceDisplayer = initDanceDisplayer(dance: dance, clockRate: 0.55, gameScene: gameScene, fallingDownRate: 6)
            danceDisplayer.displayDance()
        }
    
        
        switch song {
        case .odeToJoy:
            initMusic(gameScene: gameScene, offset: 4.72, fileName: "ode_to_joy.m4a")
        case .minuet:
            initMusic(gameScene: gameScene, offset: 4.72, fileName: "minuet.m4a")
        case .turkishMarch_1:
            initMusic(gameScene: gameScene, offset: 4.60, fileName: "turkish_march_1.m4a")
        case .turkishMarch_2:
            initMusic(gameScene: gameScene, offset: 4.50, fileName: "turkish_march_2.m4a")
        }
        
        // SET UP DANCER
        initDancer(dancer: dancer, gameScene: gameScene)
        
        return gameView
        
    }
    
    // TODO: Rethink where you will initialise the song.
    // TODO: MUSIC CAN BE FOUND HERE
    static public func initMusic(gameScene: GameScene, offset: Double, fileName: String) {
        var testMusicTrack = MusicTrack(offset: offset, fileName: fileName)
        gameScene.addChild(testMusicTrack.audioNode)
        testMusicTrack.startSong()
    }
    
    // TODO: fix up pre-loaded Dances
    // FIXME: Currently only doing easy song.
    // This method sets up the Dances needed for the game.
    static func initDance(predefinedDance: PredefinedDance) -> Dance {
        
        let newDance = Dance()
        switch predefinedDance {
        case .twinkletwinkle:
            newDance.loadTwinkleTwinkle()
        }
        return newDance
    }
    
    static func initDance(preDefinedSong: Song) -> Dance {
        let newDance = Dance()
        
        switch preDefinedSong {
        case .odeToJoy:
            newDance.loadOdeToJoy()
        case .minuet:
            newDance.loadMinuet()
        case .turkishMarch_1:
            newDance.loadTurkishMarch_1()
        case .turkishMarch_2:
            newDance.loadTurkishMarch_2()
        }
        
        return newDance
    }
    
    static func initDanceDisplayer(dance: Dance, clockRate: Double, gameScene: GameScene, fallingDownRate: Double) -> DanceDisplayer {
        return DanceDisplayer(dance: dance, clockRate: clockRate, scene: gameScene, fallingDownRate: fallingDownRate)
    }
    
    static func initDancer(dancer: Dancer, gameScene: GameScene) {
        switch dancer {
        case .avocado:
            let avocado_1 = SKSpriteNode(imageNamed: AVOCADO_1)
            let avocado_2 = SKSpriteNode(imageNamed: AVOCADO_2)
            let avocado_3 = SKSpriteNode(imageNamed: AVOCADO_3)
            let avocado_4 = SKSpriteNode(imageNamed: AVOCADO_4)
            let avocado_5 = SKSpriteNode(imageNamed: AVOCADO_5)
            gameScene.setDancerNodes(dancerNodes: [avocado_1, avocado_2, avocado_3, avocado_4, avocado_5])
            
        case .cat:
            let cat_1 = SKSpriteNode(imageNamed: CAT_1)
            let cat_2 = SKSpriteNode(imageNamed: CAT_2)
            let cat_3 = SKSpriteNode(imageNamed: CAT_3)
            let cat_4 = SKSpriteNode(imageNamed: CAT_4)
            let cat_5 = SKSpriteNode(imageNamed: CAT_5)
            gameScene.setDancerNodes(dancerNodes: [cat_1, cat_2, cat_3, cat_4, cat_5])
        
        case .penguin:
            let pingu_1 = SKSpriteNode(imageNamed: PINGU_1)
            let pingu_2 = SKSpriteNode(imageNamed: PINGU_2)
            let pingu_3 = SKSpriteNode(imageNamed: PINGU_3)
            let pingu_4 = SKSpriteNode(imageNamed: PINGU_4)
            let pingu_5 = SKSpriteNode(imageNamed: PINGU_5)
            gameScene.setDancerNodes(dancerNodes: [pingu_1, pingu_2, pingu_3, pingu_4, pingu_5])
        }
    }
}
