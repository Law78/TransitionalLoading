
import Foundation
import SpriteKit

// MARK: - Debug
let kDebug = true

// MARK: - Screen dimension convenience
let kViewSize = UIScreen.mainScreen().bounds.size
let kScreenCenter = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)

// MARK: - Device size convenience - it tell us if device is an iPhone or an iPad
let kDeviceTablet = (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad)

// MARK: - Some Common Settings
let kDefaultFont = "Edit Undo BRK"
let kDefaultFontSize = UIScreen.mainScreen().bounds.size.width * 0.1
