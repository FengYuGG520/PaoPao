//
//  FYTabBarController.swift
//  PaoPao
//
//  Created by YGBD on 2020/6/11.
//  Copyright © 2020 FengYu. All rights reserved.
//

class FYTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.isHidden = true
        addChildVC()
    }
    
    func addChildVC() {
        // 首页
        let homeVC = UIViewController.fy_vc(inSB: "Main", ID: "FYHomeVC") as! FYHomeVC
        addChildViewController(childVc: homeVC, title: "Home", imageName: "", selectImage: "")
    }
    
    func addChildViewController(childVc: UIViewController, title: String, imageName: String, selectImage: String) {
        childVc.title = title
        childVc.tabBarItem.image = UIImage.fy_originalImgNamed(name: imageName)
        childVc.tabBarItem.selectedImage = UIImage.fy_originalImgNamed(name: selectImage)
        let childNav = FYNavigationController(rootViewController: childVc)
        addChild(childNav)
    }
    
}
