//
//  TabBarController.swift
//  Sample
//
//  Created by Sammandhamoorthy, Gowrie [PBW-OT] on 10/20/22.
//

import UIKit


class TabBarController: UITabBarController {
    let shouldShowView3 = true
    var tabItems = [UIViewController]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        addTabBarItems()
        tabBarTheme()
        
        if tabItems.count > 0 {
            for (i, item) in tabItems.enumerated() {
                let itemView = tabBar.subviews[i]
                if let imageView = itemView.subviews.first as? UIImageView {
                    imageView.contentMode = .center
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let subView = tabBar.subviews[selectedIndex].subviews.first as? UIImageView {
            animate(subView)
        }
    }
    
    private func addTabBarItems() {
        
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        
        guard let vc1 = storyboard.instantiateViewController(withIdentifier: "ViewController1") as? ViewController1 else { return }
        vc1.tabBarItem.title = "V1"
        vc1.tabBarItem.image = UIImage(named: "vw1")
        tabItems.append(vc1)
        
        guard let vc2 = storyboard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 else { return }
        vc2.tabBarItem.title = "V2"
        vc2.tabBarItem.image = UIImage(named: "vw2")
        tabItems.append(vc2)
        
        if shouldShowView3 {
            guard let vc3 = storyboard.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3 else { return }
            vc3.tabBarItem.title = "V3"
            vc3.tabBarItem.image = UIImage(named: "vw3")
            tabItems.append(vc3)
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
    }
}



extension TabBarController: UITabBarControllerDelegate  {
    
    private func animate(_ imageView: UIImageView) {

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .transitionCurlUp, animations: {
            imageView.transform = CGAffineTransform(scaleX: 2.4, y: 2.4)
        })
    }
    
    private func resetAnimation(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)

    }

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let index = self.tabBar.items?.firstIndex(of: item) else {
            return
        }
    
        if let subView = tabBar.subviews[index+1].subviews.first as? UIImageView {
            self.animate(subView)
        }
        if index != self.selectedIndex,
                  let subView = tabBar.subviews[self.selectedIndex+1].subviews.first as? UIImageView {
            self.resetAnimation(subView)
        }
        
        selectedIndex = index
    }
}
