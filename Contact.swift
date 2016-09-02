import Foundation


class Contact {
    class var Scene: UInt32             { return 1 << 0 }
    class var Meteor: UInt32            { return 1 << 1 }
    class var Star: UInt32              { return 1 << 2 }
    class var Enemy: UInt32             { return 1 << 3 }
    class var EnemyShipBullet: UInt32   { return 1 << 4 }
    class var SpaceShipBullet: UInt32   { return 1 << 5 }
    class var Player: UInt32            { return 1 << 6 }
}

// use: BodyType.Player.rawValue
enum BodyType:UInt32 {
    case Scene = 1
    case Meteor = 2
    case Star = 4
    case Enemy = 8
    case EnemyShipBullet = 16
    case SpaceShipBullet = 32
    case Player = 64
}

struct physicsCatagory {
    static let Scene: UInt32 = 0x01 << 0
    static let Meteor : UInt32 = 0x1 << 1
    static let Star : UInt32 = 0x1 << 2
    static let Enemy : UInt32 = 0x1 << 3
    static let EnemyShipBullet : UInt32 = 01 << 4
    static let SpaceShipBullet : UInt32 = 01 << 5
    static let Player : UInt32 = 01 << 6
}