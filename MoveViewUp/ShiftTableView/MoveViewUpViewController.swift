//
//  ViewController.swift
//  ShiftTableView
//
//  Created by Thomas Dye on 5/12/20.
//  Copyright © 2020 Thomas Dye. All rights reserved.
//


import UIKit

class MoveViewUpViewController: UIViewController {

    @IBOutlet weak var bottomTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpKeyboardNotification()
    }
    
    func setUpKeyboardNotification() {
        self.view.frame.origin.y = 0
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if bottomTextField.isEditing {
                self.view.frame.origin.y = -(keyboardHeight)
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
            self.view.frame.origin.y = 0
    }
}
