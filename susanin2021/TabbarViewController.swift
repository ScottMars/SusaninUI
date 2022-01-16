//
//  TabbarViewController.swift
//  susanin2021
//
//  Created by Scott_Mars on 14.01.2022.
//

import UIKit

class TabbarViewController: UITabBarController {

    private let customTabBarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let map = MapViewController()
        let profile = ProfileViewController()
        let nav = NavigationViewController()
        
        setViewControllers([profile, map, nav], animated: false)
        selectedIndex = 1
        
        if let tabBarItem1 = tabBar.items?[0] {
            tabBarItem1.image = UIImage(named: "icon_user")
            tabBarItem1.selectedImage = UIImage(named: "icon_user_selected")
        }
        if let tabBarItem2 = tabBar.items?[1] {
            tabBarItem2.image = UIImage(named: "icon_location")
            tabBarItem2.selectedImage = UIImage(named: "icon_location")
        }
        if let tabBarItem3 = tabBar.items?[2] {
            tabBarItem3.image = UIImage(named: "icon_nav")
            tabBarItem3.selectedImage = UIImage(named: "icon_nav")
        }
        
        
        customTabBarView.backgroundColor = .white
        customTabBarView.clipsToBounds = true
        
        customTabBarView.layer.masksToBounds = false
        customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
        customTabBarView.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        customTabBarView.layer.shadowOpacity = 0.4
        customTabBarView.layer.shadowRadius = 10.0
        
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(tabBar)
        
        tabBar.unselectedItemTintColor = UIColor(named: "normalGray")
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        customTabBarView.frame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.y - 15, width: tabBar.frame.width, height: tabBar.frame.height + 15)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
