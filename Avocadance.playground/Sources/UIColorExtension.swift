import Foundation
import UIKit

// SOURCE: https://stackoverflow.com/questions/437113/how-to-get-rgb-values-from-uicolor
public extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

