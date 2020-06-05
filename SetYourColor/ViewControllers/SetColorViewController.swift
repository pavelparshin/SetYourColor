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
    
    var currentColor: UIColor!
    var isUpdate = false
    
    var colorDelegate: CurrentColorDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        setColor()
        showCurrentValue(with: valueRGBSliders)
        
    }
    
    
    //MARK: IB Actions
    @IBAction func setRGBSliders(_ sender: UISlider) {
        
        viewColorOnText(with: sender)
        setColor()
    }
    
    @IBAction func doneButton() {
        colorDelegate.setCurrentColor(currentColor)
        dismiss(animated: true)
    }
    
    //MARK: Set color
    //Изменяет значения слайдеров
    private func setColor() {
        if let transmittedColor = currentColor, isUpdate {
            
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            transmittedColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            valueRGBSliders[0].value = Float(red)
            valueRGBSliders[1].value = Float(green)
            valueRGBSliders[2].value = Float(blue)
            
            isUpdate = false
        }
        
        currentColor = UIColor(red: CGFloat(valueRGBSliders[0].value),
                               green: CGFloat(valueRGBSliders[1].value),
                               blue: CGFloat(valueRGBSliders[2].value),
                               alpha: 1.0)
        
        colorView.backgroundColor = currentColor
    }
    
    //MARK: Change Label and TF value
    //Изменяет текст Label и TextField по тэгу слайдера
    private func viewColorOnText(with slider: UISlider) {
        valueRGBLabels[slider.tag].text = stringValue(slider.value)
        valueRGBTextField[slider.tag].text = stringValue(slider.value)
    }
    
    private func showCurrentValue(with sliders: [UISlider]) {
        for slider in sliders {
            viewColorOnText(with: slider)
        }
    }
    
    private func stringValue(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
}

extension SetColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let setSliderValue: Float = Float(textField.text!) {
            valueRGBLabels[textField.tag].text = textField.text
            valueRGBSliders[textField.tag].value = setSliderValue
        }
    }
    
}

