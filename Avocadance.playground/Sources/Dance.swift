import Foundation
import UIKit


/* Helper function enabling decreasing for-loops.
 * SOURCE: https://stackoverflow.com/questions/24372559/reverse-range-in-swift .*/
infix operator >>> : RangeFormationPrecedence
func >>><Bound>(maximum: Bound, minimum: Bound)
    -> ReversedRandomAccessCollection<CountableRange<Bound>>
    where Bound : Comparable & Strideable {
        return (minimum..<maximum).reversed()
}

/* This class represents the data structure of a "Dance".
 * Four main "Lines" exist, on which "Rhythms" are embedded.
 * NOTE: As this is a Mac Playground, only single clicks/taps are possible
 * at one specific point in time. */
public class Dance {
    
    // Two dimensional array holding the four "Lines", each "Line" holding multiple "Rhythms".
    public var components: [[Rhythm?]]
    
    public init() {
        self.components = [[], [], [], []]
    }
    
    // Adds a Slider Rhythm in one of the 4 lines, at a position, with a given rhythm length.
    // This method is publicly available.
    public func addSliderRhythm(sliderRhythm: SliderRhythm, line: Int, position: Int) {
        let positionEnd = position + sliderRhythm.length
        for i in positionEnd>>>position {
            addNewComponent(rhythm: sliderRhythm, line: line, position: i)
        }
    }
    
    // Adds a Tap Rhythm in one of the 4 lines, at a position.
    public func addTapRhythm(tapRhythm: TapRhythm, line: Int, position: Int) {
        addNewComponent(rhythm: tapRhythm, line: line, position: position)
    }
    
    // Method that adds new Rhythms to the data structure.
    private func addNewComponent(rhythm: Rhythm, line: Int, position: Int) {
        
        // Make sure given line number actually exists.
        if line >= components.count {
            return
        }
        
        // Enlargen the correct line array, pad with 0s and adjust all other lines IF the array is not big enough.
        if position >= components[line].count {
            for i in 0..<components.count {
                
                let paddingEnd = position - components[i].count
                
                // Fulfil padding for line that new entry has been added to.
                if i == line {
                    // Create corresponding padding.
                    for _ in 0 ..< paddingEnd {
                        components[i].append(nil)
                    }
                    // Add the specified rhythm.
                    components[i].append(rhythm)
                }
                else {
                    // Pad all other arrays with 0s.
                    for _ in 0...paddingEnd {
                        components[i].append(nil)
                    }
                }
            }
        } else {
            // If the array is large enough, add the new move to the position and reset all other arrays at that position to 0.
            for i in 0..<components.count {
                if i == line {
                    components[i][position] = rhythm
                    continue
                }
                components[i][position] = nil
            }
        }
    }
    
    // Debugging helper method.
    func printDanceLine() {
        for i in 0..<components.count {
            for j in 0..<components[i].count {
                guard let component = components[i][j] else {
                    print("Line: \(i), Position: \(j), Dance Move: None")
                    continue
                }
                print("Line: \(i), Position: \(j), Dance Move: \(component)")
            }
            print("\n")
        }
    }
    
    // Accompanying rhythms for the "Twinkle Twinkle Little Star".
    public func loadTwinkleTwinkle() {
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 0)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 2)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 3)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 4)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 5)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 6)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 8)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 9)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 5), line: 1, position: 10)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 16)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 17)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 18)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 19)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 20)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 21)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 22)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 24)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 25)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 26)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 27)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 28)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 29)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 30)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 32)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 33)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 34)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 35)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 36)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 37)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 38)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 40)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 41)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 42)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 43)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 44)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 45)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 46)
    }
    
    // Accompanying rhythms for the Bach's "Ode To Joy".
    public func loadOdeToJoy() {
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 0)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 2)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 3)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 4)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 5)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 6)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 7)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 8)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 9)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 10)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 11)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 12)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 14)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 16)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 17)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 18)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 19)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 20)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 21)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 22)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 23)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 24)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 25)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 26)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 27)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 28)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 30)
    }
    
    // Accompanying rhythms for the Bach's "Minuet in G".
    public func loadMinuet() {
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 0)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 0, position: 1)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 4)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 5)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 6)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 1, position: 7)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 10)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 11)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 12)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 3, position: 13)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 2, position: 16)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 1, position: 19)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 22)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 23)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 24)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 0, position: 25)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 28)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 29)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 30)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 1, position: 31)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 34)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 35)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 36)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 2, position: 37)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 3, position: 40)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 3), line: 2, position: 43)
    }
    
    // Accompanying rhythms for the Mozart's "Turkish March" (Part 1).
    public func loadTurkishMarch_1() {
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 2)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 3)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 4)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 5)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 6)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 7)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 8)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 7), line: 2, position: 9)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 16)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 17)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 18)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 19)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 20)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 21)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 22)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 23)
        addSliderRhythm(sliderRhythm: SliderRhythm(length: 9), line: 2, position: 24)
    }
    
    // Accompanying rhythms for the Mozart's "Turkish March" (Part 2).
    public func loadTurkishMarch_2() {
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 1)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 2)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 3)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 4)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 5)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 6)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 7)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 8)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 9)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 10)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 11)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 12)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 13)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 14)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 15)
        addTapRhythm(tapRhythm: TapRhythm(), line: 3, position: 16)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 18)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 19)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 20)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 21)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 22)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 23)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 24)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 25)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 26)
        addTapRhythm(tapRhythm: TapRhythm(), line: 0, position: 27)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 28)
        addTapRhythm(tapRhythm: TapRhythm(), line: 1, position: 29)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 30)
        addTapRhythm(tapRhythm: TapRhythm(), line: 2, position: 31)
    }
    
    
    // This gives all rhythm elements a color so in the end it looks like a gradient
    // with a transition between startColor and endColor.
    public func createGradient(_ startColor: UIColor, _ endColor: UIColor) {
        
        if components[0].count <= 1 {
            return
        }
        
        let standardWeight = 1 / (Double(components[0].count-1))
        
        for i in 0..<components.count {
            for j in 0..<components[i].count {
                if let component = components[i][j] as Rhythm! {
                    let weight: Double = Double(j) * standardWeight
                    let color = interpolateColor(startColor: startColor, endColor: endColor, weight: weight)
                    component.color = color
                }
            }
        }
    }
    
    // Interpolates two colors given a weight.
    func interpolateColor(startColor: UIColor, endColor: UIColor, weight: Double) -> UIColor {
        let red = startColor.redValue + (endColor.redValue - startColor.redValue) * CGFloat(weight)
        let green = startColor.greenValue + (endColor.greenValue - startColor.greenValue) * CGFloat(weight)
        let blue = startColor.blueValue + (endColor.blueValue - startColor.blueValue) * CGFloat(weight)
        
        let middleColor = UIColor(red: red, green: green, blue: blue, alpha: 0.95)
        
        return middleColor
    }
}

