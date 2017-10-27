//
//  ListViewController.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    internal var model: ModelVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        // usually fetch request to model with completion handler
    }
    
    private func setUP() {
        guard let dataModel = model else {
            // show empty screen message
            return
        }
        titleTextLabel.text = dataModel.descriptionText
        title = dataModel.title
        nextButton.setTitle(dataModel.titleButton, for: .normal)
        titleTextLabel.text = dataModel.descriptionText
        nextButton.applyGradientWith(startColor: CommonAppearance.buttonGradientColorFrom, endColor: CommonAppearance.buttonGradientColorTo)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        presentFinalVC(.final)
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard model != nil else {
            return 0
        }
        return model?.cells?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataModel = model?.cells![indexPath.row] else {
            return UITableViewCell()
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier) as? ListTableViewCell {
            cell.configureWithModel(model: dataModel)
            return cell
        }
        return UITableViewCell()
    }
}
