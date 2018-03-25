
import PlaygroundSupport
/*:
 # Getting Better Now! 🕺💃🎼
 
 Our three friends 🥑🐱🐧 are ready to learn more. Mr. Avocado proposes to move on to new, more difficult songs!

 - - -
 ## New Songs, New Beginnings 🎼
 Mr. Avocado is ready! I created some rhythms for famous tunes from classical music. You can choose from **Bach's Minuet in G** or his **Ode to Joy**, and additionally, you can find two versions of **Mozart's Turkish March**. Feel free to get groooovy! 🕺
 
 You can check out the other songs by changing `Song.minuet` to `Song.odeToJoy`, `Song.turkishMarch_1` or `Song.turkishMarch_2` - remember to ▶️ again!

 */

var view = Setup.startGame(withSong: Song.odeToJoy)
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ## Build your own rhythm! 🥑🐱🐧🎼
 
 Ready to build a rhythm yourself? It's super easy! Pick a song, for example, `Song.odeToJoy`, and then, add in the `Dance` (with your personal rhythms) to the line of code below. I have already added a couple of `TapRhythm`s- and `SlideRhythm`s as a start. Feel free to change the dancer! 🥑🐱🐧
 */

let yourDance = Dance()

// Add some tap and slider rhythms.
// `line` tells you whether the Rhythm will be going towards the first, second, etc. Rhythm Panel.
// `position` tells you at which beat in the song the rhythm plays.
// For slider rhythms, you also have to add in how many beats it lasts.
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 0)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 2)
yourDance.addSliderRhythm(sliderRhythm: SliderRhythm(length:3), line: 1, position: 3)
yourDance.addSliderRhythm(sliderRhythm: SliderRhythm(length:3), line: 2, position: 6)
yourDance.addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 9)


// Uncomment these lines to try out your new rhythm!!!
/*
 view = Setup.startGame(withDance: yourDance, withSong: .odeToJoy, withDancer: .penguin)
 PlaygroundSupport.PlaygroundPage.current.liveView = view
*/









