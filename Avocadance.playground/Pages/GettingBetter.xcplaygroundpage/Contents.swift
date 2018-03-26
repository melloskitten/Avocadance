
import PlaygroundSupport
/*:
 # Getting Better Now! 🕺💃🎼
 
 Our three friends 🥑🐱🐧 are ready to learn more about classical music. Mr. Avocado proposes to move on to more difficult songs!

 - - -
 ## New Songs, New Beginnings 🎼
I created some rhythms for famous tunes from classical music. You can choose from **Bach's Minuet in G** or his **Ode to Joy**, and additionally, you can find two versions of **Mozart's Turkish March**. Feel free to get groooovy! 🕺
 
 You can check out the other songs by changing `Song.minuet` to `Song.odeToJoy`, `Song.turkishMarch_1` or `Song.turkishMarch_2` - remember to ▶️ again!

 */

var view = Setup.startGame(withSong: Song.minuet)
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ## Build your own rhythm and color it! 🥑🐱🐧🎼
 
 Ready to build a rhythm yourself? It's super easy! Pick a song, for example, `Song.odeToJoy`, and then, add in the `Dance` (with your personal rhythms) to the line of code below. You can also change the gradient of the rhythms by calling `.createGradient(#colorLiteral, #colorLiteral)`. I have already added a couple of `TapRhythm`s- and `SlideRhythm`s as well as a gradient as a start. Feel free to change the dancer! 🥑🐱🐧
 */

let yourDance = Dance()

/* Add some tap and slider rhythms.
 * `line` tells you whether the Rhythm will be going towards the first, second, etc. Rhythm Panel.
 * `position` tells you at which beat in the song the rhythm plays.
 *  For slider rhythms, you also have to add in how many beats it lasts. */

yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 0)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 2)
yourDance.addSliderRhythm(sliderRhythm: SliderRhythm(length:3), line: 1, position: 3)
yourDance.addSliderRhythm(sliderRhythm: SliderRhythm(length:3), line: 2, position: 6)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 9)

// Here you can adjust the gradient!
yourDance.createGradient(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))

// Uncomment these lines to try out your new rhythm!!!
/*
view = Setup.startGame(withDance: yourDance, withSong: .odeToJoy, withDancer: .penguin)
 PlaygroundSupport.PlaygroundPage.current.liveView = view
*/










