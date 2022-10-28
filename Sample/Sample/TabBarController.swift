//
//  TabBarController.swift
//  Sample
//
//  Created by Sammandhamoorthy, Gowrie [PBW-OT] on 10/20/22.
//

import UIKit

enum TabBarItems {
    case vw1
    case vw2
    case vw3
    case vw4
    case vw5
    
    var itemTitle: String {
        switch self {
        case .vw1:
            return "vw1"
        case .vw2:
            return "vw2"
        case .vw3:
            return "vw3"
        case .vw4:
            return "vw4"
        case .vw5:
            return "vw5"
        }
    }
    
    var itemImage: String {
        switch self {
        case .vw1:
            return "vw1"
        case .vw2:
            return "vw2"
        case .vw3:
            return "vw3"
        case .vw4:
            return "vw3"
        case .vw5:
            return "vw3"
        }
    }
    
    var controller: UIViewController? {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let vw: UIViewController?
        
        switch self {
        case .vw1:
            vw = storyboard.instantiateViewController(withIdentifier: "ViewController1") as? ViewController1
        case .vw2:
            vw = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2
        case .vw3:
            vw = storyboard.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3
        case .vw4:
            vw = storyboard.instantiateViewController(withIdentifier: "ViewController4") as? ViewController4
        case .vw5:
            vw = storyboard.instantiateViewController(withIdentifier: "ViewController5") as? ViewController5
        }
        
        guard let viewcontroller = vw else {
            return nil
        }
        viewcontroller.tabBarItem.title = itemTitle
        viewcontroller.tabBarItem.image = UIImage(named: itemImage)
        return viewcontroller
    }
}

class TabBarController: UITabBarController {
    var circleMask: UIView!
    var tempLayers: [CAShapeLayer] = []
    
    let shouldShowView3 = true
    var tabItems = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        addTabBarItems()
        tabBarTheme()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.addIndicatorView(index: self.selectedIndex, isFirstTime: true)
        }
    }
    
    private func addTabBarItems() {
        let items: [TabBarItems] = [.vw1, .vw2, .vw3, .vw4, .vw5]
        for (tabItem) in items {
            if let controller = tabItem.controller {
                tabItems.append(controller)
            }
        }
        viewControllers = tabItems
    }
    
    private func tabBarTheme() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        tabBar.tintColor = .white
    }
    
    private func addIndicatorView(index: Int, isFirstTime: Bool = false) {
        if !isFirstTime {
            for temp in self.tempLayers {
                temp.removeFromSuperlayer()
            }
            tempLayers.removeAll()
            circleMask.removeFromSuperview()
            self.view.layoutIfNeeded()
        }
        
        for i in 0..<tabBar.items!.count {
            guard let tabBarView = tabBar.items?[i].value(forKey: "view") as? UIView else {
                return
            }
            
            if let item = tabBar.items?[i] as? UITabBarItem {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
            }
            
            let path: UIBezierPath = UIBezierPath()
            path.move(to: CGPoint(x: tabBarView.frame.minX - 2,
                                  y: 0.5))
            
            if i != index {
                path.addLine(to: CGPoint(x: tabBarView.frame.maxX + 2,
                                         y: 0.5))
            } else {
                let space: CGFloat = 30
                let curveWidth = tabBarView.frame.size.width / 4
                path.addCurve(to: CGPoint(x: tabBarView.frame.maxX + 2, y: 0.2),
                              controlPoint1: CGPoint(x:  tabBarView.frame.minX + curveWidth, y: -space),
                              controlPoint2: CGPoint(x: tabBarView.frame.minX + curveWidth * 3, y: -space))
                
                //Draw circle while animation
                let width = tabBarView.frame.size.width/6 //8
                let x: CGFloat = tabBarView.center.x - width / 2.0
                circleMask = UIView(frame: CGRect(x: x,
                                                  y: tabBarView.frame.minY + 15,
                                                  width: width,
                                                  height: width))
                circleMask.backgroundColor = UIColor.red
                circleMask.layer.cornerRadius = width / 2.0
                circleMask.layer.masksToBounds = true
                tabBar.insertSubview(circleMask, at: 0)
                
                if let item = tabBar.items?[i] as? UITabBarItem {
                    item.titlePositionAdjustment = UIOffset(horizontal: 0,
                                                            vertical: 20.0)
                }
            }
            
            let shapeLayer: CAShapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.borderWidth = 2.0
            shapeLayer.fillMode = .forwards
            tempLayers.append(shapeLayer)
            tabBar.layer.addSublayer(shapeLayer)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1) {
            self.circleMask.transform = CGAffineTransform(scaleX: 5, y: 5)
        }
    }
}


extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addIndicatorView(index: self.selectedIndex)
    }
}
