//
//  StartViewController.swift
//  Umzugscoach
//
//  Created by Alex on 25.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

enum ModeUiVC {
    case start
    case final
}

class StartViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var topDescriptionTextLabel: UILabel!
    @IBOutlet weak var bottomDescriptionTextLabel: UILabel!
    @IBOutlet weak var startContainerView: UIView!
    @IBOutlet weak var finalContainerView: UIView!
    
    @IBOutlet weak var AltverträgeButton: UIButton!
    @IBOutlet weak var StromvertragButton: UIButton!
    @IBOutlet weak var VerträgeButton: UIButton!
    
    
    internal var stateMode: ModeUiVC = .start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initialAnimationSetUP()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar()
    }
    
    private func setUP() {
        titleTextLabel.hide()
        topDescriptionTextLabel.hide()
        bottomDescriptionTextLabel.hide()
        startContainerView.hide()
        finalContainerView.hide()
        logoImageView.hide()
        startButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
        AltverträgeButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
        StromvertragButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
        VerträgeButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
        AltverträgeButton.addCornerRadius(radius: 4)
        StromvertragButton.addCornerRadius(radius: 4)
        VerträgeButton.addCornerRadius(radius: 4)
    }
    
    private func initialAnimationSetUP() {
        switch stateMode {
        case .start:
            setUPStartMode()
        case .final:
            setUPFinalMode()
        }
    }
    
    private func setUPStartMode() {
        logoImageView.show()
        startContainerView.show()
        startButton.setTitle(NSLocalizedString("Jetzt starten", comment: ""), for: .normal)
        titleTextLabel.text = NSLocalizedString("Yomo Umzugscoach", comment: "")
        startAnimate()
    }
    
    private func setUPFinalMode() {
        logoImageView.show()
        titleTextLabel.text = NSLocalizedString("Versand erfolgt", comment: "")
        logoImageView.image = UIImage(named: "email")
        startButton.hide()
        finishAnimate()
    }
}

extension StartViewController: InitialAnimation {
    func animate() {
        topDescriptionTextLabel.showWithAnimationAfterDelay(0.2, 1.5)
        bottomDescriptionTextLabel.showWithAnimationAfterDelay(0.2, 2.0)
        logoImageView.showWithDamping(duration: 1.0, delay: 0)
        titleTextLabel.showWithAnimationAfterDelay(0.2, 0.5)
    }
    
    func startAnimate() {
        logoImageView.showWithDamping(duration: 1.0, delay: 0)
        titleTextLabel.showWithAnimationAfterDelay(0.2, 0.5)
        topDescriptionTextLabel.showWithAnimationAfterDelay(0.2, 1.0)
        bottomDescriptionTextLabel.showWithAnimationAfterDelay(0.2, 1.5)
        startButton.moveUP(superView: self.view)
    }
    
    func finishAnimate() {
        logoImageView.showWithDamping(duration: 1.0, delay: 0)
        UIView.animate(withDuration: 1.0, animations: {
            self.finalContainerView.show()
        })
    }
}

protocol InitialAnimation {
    func animate()
    func startAnimate()
    func finishAnimate()
}
