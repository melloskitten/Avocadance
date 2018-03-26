import PlaygroundSupport
import Foundation
import SpriteKit

// This class poses as an interface for the playground pages.
public class Setup {

    // Loads the scene on the first playground page.
    public static func initIntroScene() -> SKView {
        let introScene = IntroScene(size: CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        let view = SKView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        view.presentScene(introScene)
        return view
    }
    
    // This method is the simplest way to initialise the game,
    // used in the first level with default song and dancer.
    public static func startGame(withDancer dancer: Dancer) -> SKView {
        
        // Set up game screen.
        let (gameView, gameScene) = setUpGameScreen()
        
        // Set up dance.
        let dance = initDance(predefinedSong: .twinkletwinkle)
        
        // Set up dance displayer and the corresponding music.
        initDanceDisplayer(song: .twinkletwinkle, dance: dance, gameScene: gameScene)
        initMusic(gameScene: gameScene, song: .twinkletwinkle)
        
        // Set up dancer.
        initDancer(dancer: dancer, gameScene: gameScene)
        
        return gameView
    }
    
    public static func startGame(withSong song: Song) -> SKView {
        // Set up game screen.
        let (gameView, gameScene) = setUpGameScreen()
        
        // Set up dance.
        let dance = initDance(predefinedSong: song)
        
        // Set up dance displayer and the corresponding music.
        initDanceDisplayer(song: song, dance: dance, gameScene: gameScene)
        initMusic(gameScene: gameScene, song: song)

        // SET UP DANCER
        initDancer(dancer: Dancer.avocado, gameScene: gameScene)
 
        return gameView
    }
    
    public static func startGame(withDance dance: Dance, withSong song: Song, withDancer dancer: Dancer) -> SKView {
        
        // Set up game screen.
        let (gameView, gameScene) = setUpGameScreen()
        
        // Set up dance displayer and the corresponding music.
        initDanceDisplayer(song: song, dance: dance, gameScene: gameScene)
        initMusic(gameScene: gameScene, song: song)
        
        // Set up the dancer.
        initDancer(dancer: dancer, gameScene: gameScene)
        
        return gameView
    }
    
    // Sets up the Game View and Game Scene.
    static func setUpGameScreen() -> (SKView, GameScene) {
        let gameView = SKView(frame: CGRect(x: 0, y: 0, width: 600, height: 775))
        let gameScene = GameScene(size: CGSize(width: 600, height: 775))
        gameView.presentScene(gameScene)
        return (gameView, gameScene)
    }
    
    // Sets up the Music for the level & starts it.
    static public func initMusic(gameScene: GameScene, song: Song) {
        var testMusicTrack: MusicTrack
        switch song {
        case .twinkletwinkle:
            testMusicTrack = MusicTrack(offset: TWINKLE_TWINKLE_OFFSET, fileName: TWINKLE_TWINKLE)
        case .odeToJoy:
            testMusicTrack = MusicTrack(offset: ODE_TO_JOY_OFFSET, fileName: ODE_TO_JOY)
        case .minuet:
            testMusicTrack = MusicTrack(offset: MINUET_OFFSET, fileName: MINUET)
        case .turkishMarch_1:
            testMusicTrack = MusicTrack(offset: TURKISH_MARCH_1_OFFSET, fileName: TURKISH_MARCH_1)
        case .turkishMarch_2:
            testMusicTrack = MusicTrack(offset: TURKISH_MARCH_2_OFFSET, fileName: TURKISH_MARCH_2)
        }
        gameScene.addChild(testMusicTrack.audioNode)
        testMusicTrack.startSong()
    }
    
    // Sets up the dance.
    static func initDance(predefinedSong: Song) -> Dance {
        let dance = Dance()
        switch predefinedSong {
        case .twinkletwinkle:
            dance.loadTwinkleTwinkle()
            dance.createGradient(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        case .odeToJoy:
            dance.loadOdeToJoy()
            dance.createGradient(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        case .minuet:
            dance.loadMinuet()
            dance.createGradient(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
        case .turkishMarch_1:
            dance.loadTurkishMarch_1()
            dance.createGradient(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        case .turkishMarch_2:
            dance.loadTurkishMarch_2()
            dance.createGradient(#colorLiteral(red: 0, green: 0.4117647059, blue: 0.8509803922, alpha: 1), #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))
        }
        return dance
    }
    
    // This method creates the Dance Displayer given the predefined song and starts it.
    static func initDanceDisplayer(song: Song, dance: Dance, gameScene: GameScene) {
        var dd: DanceDisplayer
        switch song {
        case .twinkletwinkle:
           dd = DanceDisplayer(dance: dance, clockRate: 0.5, scene: gameScene, fallingDownRate: 6)
        case .odeToJoy:
            dd = DanceDisplayer(dance: dance, clockRate: 0.55, scene: gameScene, fallingDownRate: 6)
        case .minuet:
            dd = DanceDisplayer(dance: dance, clockRate: 0.5, scene: gameScene, fallingDownRate: 6)
        case .turkishMarch_1:
            dd = DanceDisplayer(dance: dance, clockRate: 0.55, scene: gameScene, fallingDownRate: 6)
        case .turkishMarch_2:
            dd = DanceDisplayer(dance: dance, clockRate: 0.55, scene: gameScene, fallingDownRate: 6)
        }
        dd.displayDance()
    }
    
    // This method initialises the dancer used for the scene.
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
