import Foundation
import UIKit
// TODO: Rethink where you want to have color or fancy avocado sprites.


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
        self.color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
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
        self.color = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
    

    
}
