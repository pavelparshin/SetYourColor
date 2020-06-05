//
//  SetColorViewController.swift
//  SetYourColor
//
//  Created by Pavel Parshin on 05.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class SetColorViewController: UIViewController {
    
    // MARK: IB Outlet
    @IBOutlet var colorView: UIView!
    @IBOutlet var valueRGBLabels: [UILabel]!
    @IBOutlet var valueRGBSliders: [UISlider]!
    @IBOutlet var valueRGBTextField: [UITextField]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        showCurrentValue(with: valueRGBSliders)
        setColor()
    }
    
    @IBAction func setRGBSliders(_ sender: UISlider) {
        
        viewColorOnText(with: sender)
        setColor()
    }
    
    //MARK: Private func
    private func viewColorOnText(with slider: UISlider) {
        valueRGBLabels[slider.tag].text = stringValue(slider.value)
        valueRGBTextField[slider.tag].text = stringValue(slider.value)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(valueRGBSliders[0].value),
                                            green: CGFloat(valueRGBSliders[1].value),
                                            blue: CGFloat(valueRGBSliders[2].value),
                                            alpha: 1.0)
    }
    
    private func showCurrentValue(with sliders: [UISlider]) {
        for slider in sliders {
            viewColorOnText(with: slider)
        }
    }
    
    private func stringValue(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
