
import UIKit


final class MyShape: UIView {
    
    func initTriangle() {
        do {
            try self.triangle = makeTriangle(vals: randomPoints(count:6, upperbound:4), colorval: Color.randomColor())
        }
        catch {
            self.triangle = Triangle.makeDefault()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTriangle();
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    var triangle = Triangle.makeDefault();
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context =  UIGraphicsGetCurrentContext();
        print(triangle.description);
        self.backgroundColor = UIColor.purple
     
        
        context?.move(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.addLine(to: CGPoint(x: triangle.p2.x, y: triangle.p2.y))
        context?.addLine(to: CGPoint(x: triangle.p3.x, y: triangle.p3.y))
        context?.addLine(to: CGPoint(x: triangle.p1.x, y: triangle.p1.y))
        context?.setLineWidth(3.0)
        var thecolor = Color.Value(colorval: triangle.color)
        
        context?.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        context?.setFillColor(red: thecolor[0], green: thecolor[1], blue: thecolor[2], alpha: thecolor[3])
        context?.drawPath(using: CGPathDrawingMode.eoFillStroke)
    }
    
}


class ViewController: UIViewController {

    
    
    var timer = Timer()
    var currentShape = MyShape(frame : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIScreen.main.bounds.maxX)
        
        timer = Timer.scheduledTimer(timeInterval: 2.0,
                                     target: self,
                                     selector: #selector(tick),
                                     userInfo: nil,
                                     repeats: true)
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        self.currentShape = MyShape(frame: frame)
        self.currentShape.backgroundColor = UIColor.white
        self.view.addSubview(self.currentShape)
     
        
    }
    
    @objc func tick() {
        

        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.maxX, height: UIScreen.main.bounds.maxY)
        let shape = MyShape(frame: frame)
        self.currentShape.removeFromSuperview()
        shape.backgroundColor = UIColor.white
        self.view.addSubview(shape)
        self.currentShape = shape
    }


}

