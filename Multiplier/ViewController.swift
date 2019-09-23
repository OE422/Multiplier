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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        
        textFieldSetup(txtFld: textField1, _arg: 100)
        
    }
    func textFieldSetup (arg txtFld: UITextField, arg yCoord: Int)
    {
        
    }


}

