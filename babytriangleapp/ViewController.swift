import UIKit

class ViewController: UIViewController {

    var background = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    var currentTriangle = TriangleView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    var currentCircle = CircleView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    var currentSquare = SquareView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    var currentRectangle = RectangleVIew(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    
    @objc
    func handleGestureLeft(gesture: UISwipeGestureRecognizer) -> Void {

        self.newCircle()
    }
    
    @objc
    func handleGestureRight(gesture: UISwipeGestureRecognizer) -> Void {
        self.newTriangle()
    }
    
    @objc
    func handleGestureDown(gesture: UISwipeGestureRecognizer) -> Void {
        self.newSquare()
    }
    
    @objc
    func handleGestureUp(gesture: UISwipeGestureRecognizer) -> Void {
        self.newRectangle()
    }
 
    @objc
    func handleGestureTap(gesture: UITapGestureRecognizer) -> Void {
        let randomShapeType = Int(arc4random_uniform(UInt32(4)))
        switch (randomShapeType)
        {
        case 0:
            self.newRectangle()
        case 1:
            self.newTriangle()
        case 2:
            self.newSquare()
        default:
            self.newCircle()
        }
    }
    
    @objc
    func handleGestureTwoFingerTap(gesture: UIPinchGestureRecognizer) -> Void {
        if (Settings.drawGrid == false) {
            print("set true")
            Settings.drawGrid = true
        }
        else
        {
            print("set false")
            Settings.drawGrid = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let window = UIApplication.shared.keyWindow
        //  let topPadding = window?.safeAreaInsets.top
        // let bottomPadding = window?.safeAreaInsets.bottom
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureLeft))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureRight))
        swipeRight.direction = .right
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureDown))
        swipeDown.direction = .down
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureUp))
        swipeUp.direction = .up
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleGestureTap))
        
        let twoFingerTap = UITapGestureRecognizer(target: self, action: #selector(self.handleGestureTwoFingerTap))
        twoFingerTap.numberOfTouchesRequired = 2
       
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeUp)
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(twoFingerTap)
        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        self.currentTriangle = TriangleView(frame: frame)
        self.currentTriangle.backgroundColor = background
        self.view.addSubview(self.currentTriangle)
    }

    func newTriangle() {
        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        let shape = TriangleView(frame: frame)
        self.currentTriangle.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(shape)
        self.currentTriangle = shape
    }
    
    func newCircle() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        let shape = CircleView(frame: frame)
        self.currentCircle.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(shape)
        self.currentCircle = shape
    }
    
    func newSquare() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        let shape = SquareView(frame: frame)
        self.currentSquare.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(shape)
        self.currentSquare = shape
    }
   
    func newRectangle() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        let shape = RectangleVIew(frame: frame)
        self.currentRectangle.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(shape)
        self.currentRectangle = shape
    }
    
}

