import Foundation
import UIKit

public class Rhythm {
    var color: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

public class TapRhythm: Rhythm {
    
    public init(color: UIColor) {
        super.init()
        self.color = color
    }
    
    override public init() {
        super.init()
    }
    
}

public class SliderRhythm: Rhythm {
    var length: Int = 0
    
    public init(color: UIColor, length: Int) {
        super.init()
        self.color = color
        self.length = length
    }
    
    public init(length: Int) {
        super.init()
        self.length = length
    }
}
