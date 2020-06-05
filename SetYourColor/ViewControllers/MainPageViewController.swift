//
//  MainPageViewController.swift
//  SetYourColor
//
//  Created by Pavel Parshin on 05.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setColorVC = segue.destination as! SetColorViewController
        setColorVC.colorDelegate = self
        setColorVC.currentColor = view.backgroundColor
        setColorVC.isUpdate = true
    }
    
}

//MARK: - Delegate
extension MainPageViewController: CurrentColorDelegate {
    
    func setCurrentColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
