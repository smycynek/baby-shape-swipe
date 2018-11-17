
import UIKit


class ViewController: UIViewController {

    var background = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    var timer = Timer()
    var currentTriangle = TriangleView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    var currentCircle = CircleView(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    
    @objc
    func handleGestureLeft(gesture: UISwipeGestureRecognizer) -> Void {
       // print("Swipe")
        //self.newTriangle()
        self.newCircle()
    }
    
    @objc
    func handleGestureRight(gesture: UISwipeGestureRecognizer) -> Void {
       // print("Swipe")
        self.newTriangle()
        //self.newCircle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureLeft))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGestureRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
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
    
}

