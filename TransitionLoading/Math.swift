
import SpriteKit


func DegreesToRadians(degrees degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI) / 180.0
}

func randomBetweenFloatNumbers(firstNumber firstNumber: CGFloat, secondNumber: CGFloat) -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNumber - secondNumber) + min(firstNumber, secondNumber)
}

func randomBetweenIntNumbers(firstNumber firstNumber: Int, secondNumber: Int) -> Int {
    return Int(UInt32(firstNumber) + arc4random_uniform(UInt32(secondNumber - firstNumber + 1)))
}

func Smooth(startPoint startPoint: CGFloat, endPoint: CGFloat, filter: CGFloat) -> CGFloat {
    // You get your starting point less a few point sum with others some point
    // i.e.: if you start with 270 on x you get (with a filter:0.05) a 271 value:
    // 270 => 270 * (1 - 0.05) + 290 * 0.05 = 271
    return (startPoint * (1 - filter)) + endPoint * filter
}


func Pythagorus(startPoint startPoint: CGPoint, endPoint: CGPoint, filter: CGFloat) -> CGFloat {
    //get the distance between the destination position and the node's position
    let distance: CGFloat = sqrt(pow((endPoint.x - startPoint.x), 2.0) + pow((endPoint.y - startPoint.y), 2.0))
    if kDebug {
        print("DISTANCE:", distance)
    }
    //calculate your new duration based on the distance
    return filter*distance;
}

func DoubleToDecimal(decimalNumber decimalNumber: Double, numberOfPlaces: Int) -> Int {
    let powerOfTen:Double = pow(10.0, Double(numberOfPlaces))
    let targetedDecimalPlaces:Double = (round(decimalNumber * powerOfTen) / powerOfTen) * pow(10.0, Double(numberOfPlaces))
    return Int(targetedDecimalPlaces)

}