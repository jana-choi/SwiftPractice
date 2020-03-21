struct CoordinatePoint{
    var x: Int
    var y: Int

    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }

        // set(opposite)
        // {
        //     x = -opposite.x
        //     y = -opposite.y
        // }

        set
        {
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
print(yagomPosition)

print(yagomPosition.oppositePoint)

// yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
// print(yagomPosition)