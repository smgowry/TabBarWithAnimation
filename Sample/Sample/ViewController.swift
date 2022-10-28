//
//  ViewController.swift
//  Sample
//
//  Created by Sammandhamoorthy, Gowrie [PBW-OT] on 10/20/22.
//

import UIKit

/*
class BaseViewController: UIViewController {
    var index: Int = 0
    var pathLayer: CAShapeLayer?
    var displayLink: CADisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayLink = CADisplayLink(target: self, selector: #selector(renderTopLine))
        displayLink?.add(to: RunLoop.current, forMode: .default)
    }
    
    @objc func renderTopLine() {
        if pathLayer != nil {
            pathLayer?.removeFromSuperlayer()
        }
        
        index+=1
        print(index)
        let path: UIBezierPath = UIBezierPath()
        path.move(to:CGPoint(x: 0, y: 300))
        let space: CGFloat = 100.0 + CGFloat(index * 3)
        path.addCurve(to: CGPoint(x: view.bounds.size.width/2, y: 300),
                      controlPoint1: CGPoint(x: view.bounds.size.width / 8, y: 300 - space),
                      controlPoint2: CGPoint(x: view.bounds.size.width / 2 / 4 * 3, y: 300 - space))
        
        pathLayer = CAShapeLayer()
        pathLayer?.frame = self.view.bounds
        pathLayer?.path = path.cgPath
        pathLayer?.strokeColor = UIColor.purple.cgColor
        pathLayer?.fillColor = nil
        pathLayer?.lineWidth = 2.0
        pathLayer?.lineJoin = CAShapeLayerLineJoin.bevel
        //view.layer.addSublayer(pathLayer!)
        view.layoutIfNeeded()
        
        if index == 3 {
            displayLink?.invalidate()
            displayLink = nil
            index = 0
        }
    }
}
   */
class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}



class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}


class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }


}
