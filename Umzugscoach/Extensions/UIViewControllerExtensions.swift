//
//  UIViewControllerExtensions.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showNextVC <T:ModelVC>(withIdentifier: Screens, model: T ) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch  withIdentifier {
        case .lastAddress:
            let nextVC = mainStoryboard.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
            nextVC.isLastAddress = !nextVC.isLastAddress
            nextVC.model = model
            navigationController?.pushViewController(nextVC, animated: true)
        case .listScreen:
            let  nextVC = mainStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            nextVC.model = model
            navigationController?.pushViewController(nextVC, animated: true)
        }
        
        
    }
    
    func presentFinalVC(_ mode: ModeUiVC) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let  vc = mainStoryboard.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        vc.stateMode = mode
        present(vc, animated: true, completion: nil)
    }
    
    func hideNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func makeTransparentUINavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
}
