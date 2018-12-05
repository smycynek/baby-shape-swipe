import UIKit

class ViewController: UIViewController {
    var background = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
    var currentShape: ShapeView = TriangleView(frame: getSafeFrame())
    var backgroundView: UIView = UIView (frame: getBackgroundFrame())
     @objc
    func handleGestureLeft(gesture: UISwipeGestureRecognizer) {
        let randomShapeType = Int(arc4random_uniform(UInt32(2)))
        switch randomShapeType {
        case 0:
            self.newCircle()
        default:
            self.newEllipse()
        }
    }
    @objc
    func handleGestureRight(gesture: UISwipeGestureRecognizer) {
        self.newTriangle()
    }
    @objc
    func handleGestureDown(gesture: UISwipeGestureRecognizer) {
        self.newSquare()
    }
    @objc
    func handleGestureUp(gesture: UISwipeGestureRecognizer) {
        self.newRectangle()
    }
    func randomShape() {
        let randomShapeType = Int(arc4random_uniform(UInt32(5)))
        switch randomShapeType {
        case 0:
            self.newCircle()
        case 1:
            self.newRectangle()
        case 2:
            self.newSquare()
        case 3:
            self.newEllipse()
        default:
            self.newTriangle()
        }
    }
    @objc
    func handleGestureTap(gesture: UITapGestureRecognizer) {
      self.randomShape()
    }
    @objc
    func handleGestureTwoFingerTap(gesture: UIPinchGestureRecognizer) {
        if Settings.grid == false {
            Settings.grid = true
        } else {
            Settings.grid = false
        }
        SettingsManager.storeSettings()
        self.currentShape.setNeedsDisplay()
    }

    override func viewDidAppear( _ animated: Bool) {
    super.viewDidAppear(animated)
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.currentShape = TriangleView(frame: getSafeFrame())
        self.currentShape.backgroundColor = background
        self.view.addSubview(backgroundView)
        self.backgroundView = backgroundView
        backgroundView.addSubview(self.currentShape)
    }
    @objc
    func applicationWillEnterForeground (notification: NSNotification) {
        let currentPalette = Settings.palette
        SettingsManager.loadSettings()
        SettingsManager.updateBuildInfo()
        let shape = self.currentShape
        if currentPalette != Settings.palette {
            shape.shape!.color = ColorPicker.randomColor(palette: Settings.palette)
        }
        self.currentShape.setNeedsDisplay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.applicationWillEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
    }

    func newTriangle() {
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.backgroundView.removeFromSuperview()
        self.backgroundView = backgroundView
        let shape = TriangleView(frame: getSafeFrame())
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(shape)
        self.currentShape = shape
    }
    func newCircle() {
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.backgroundView.removeFromSuperview()
        self.backgroundView = backgroundView
        let shape = CircleView(frame: getSafeFrame())
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(shape)
        self.currentShape = shape
    }
    func newSquare() {
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.backgroundView.removeFromSuperview()
        self.backgroundView = backgroundView
        let shape = SquareView(frame: getSafeFrame())
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(shape)
        self.currentShape = shape
    }
    func newRectangle() {
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.backgroundView.removeFromSuperview()
        self.backgroundView = backgroundView
        let shape = RectangleView(frame: getSafeFrame())
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(shape)
        self.currentShape = shape
    }
    func newEllipse() {
        let backgroundView = UIView(frame: getBackgroundFrame() )
        backgroundView.backgroundColor = background
        self.backgroundView.removeFromSuperview()
        self.backgroundView = backgroundView
        let shape = EllipseView(frame: getSafeFrame())
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = background
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(shape)
        self.currentShape = shape
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        self.randomShape()
    }
}
