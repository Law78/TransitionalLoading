
import SpriteKit

class Colors {
    
    // RGB Colors
    
    class var Background: Int   { return 0x000000 }
    class var Magic: Int        { return 0x04f2de }
    class var Stars: Int        { return 0xffffe0 }
    class var FontScore: Int    { return 0x49b9ea }
    class var FontBonus: Int    { return 0xb3ff01 }
    
    class func colorFromRGB(rgbvalue rgbvalue: Int) -> SKColor {
        return SKColor (
            red: CGFloat((rgbvalue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbvalue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbvalue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
