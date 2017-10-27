//
//  AddressViewController.swift
//  Umzugscoach
//
//  Created by Alex on 25.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//


import UIKit

protocol KeyboardObserver {
    func registerForNotifications()
    func keyboardWillShow(notification: NSNotification)
    func keyboardWillHide(notification: NSNotification)
}

class AddressViewController: UIViewController {
    
    @IBOutlet weak var streetTextField: HoshiTextField!
    @IBOutlet weak var numberTextField: HoshiTextField!
    @IBOutlet weak var plzTextField: HoshiTextField!
    @IBOutlet weak var stadtTextField: HoshiTextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var keyboardHeight: NSLayoutConstraint!
    
    var isLastAddress = false
    var model: ModelVC?
    private let navigationModel = NavigationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setUP() {
        registerForNotifications()
        addButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
        makeTransparentUINavigationBar()
        setUPWithModelVC()
    }
    
    private func setUPWithModelVC() {
        guard let model = self.model else {return}
        title = model.title
        addButton.setTitle(model.titleButton, for: .normal)
        titleTextLabel.text = model.descriptionText
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        if isLastAddress {
            let modelData = navigationModel.getListModelVC()
            showNextVC(withIdentifier: Screens.listScreen, model: modelData)
            return
        }
        let modelData = navigationModel.getNextAddressVCModel()
        showNextVC(withIdentifier: Screens.lastAddress, model: modelData)
    }
    
    internal func setModel(_ model: AddressModelVC) {
        self.model = model
    }
    
}

extension AddressViewController: KeyboardObserver {
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let height = keyboardRectangle.height
            keyboardHeight.constant = height
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        keyboardHeight.constant = 0
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
}

