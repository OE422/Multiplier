//
//  ViewController.swift
//  Multiplier
//
//  Created by  on 9/23/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField1 = UITextField()
    var textField2 = UITextField()
    var productLabel = UILabel()
    var stackView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        textFieldSetup(arg: textField1)
        textFieldSetup(arg: textField2)
        
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(productLabel)
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (UIScreen.main.bounds.width/2)-((stackView.frame.maxX-stackView.frame.minX)/2), y: stackView.frame.origin.y).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 50).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/4).isActive = true
    }
    
    func textFieldSetup (arg txtFld: UITextField)
    {
        txtFld.delegate = self
        txtFld.placeholder = "Enter a number"
        txtFld.font = UIFont.systemFont(ofSize: 15)
        txtFld.borderStyle = UITextField.BorderStyle.roundedRect
        txtFld.autocorrectionType = UITextAutocorrectionType.yes
        txtFld.keyboardType = UIKeyboardType.decimalPad
        txtFld.returnKeyType = UIReturnKeyType.done
        txtFld.clearButtonMode = UITextField.ViewMode.whileEditing;
        txtFld.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        self.view.addSubview(txtFld)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        productLabel.text = String(Int(textField1.text ?? "1")! * Int(textField2.text ?? "1")!)
        return true
    }


}
