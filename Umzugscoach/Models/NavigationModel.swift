//
//  NavigationModel.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import UIKit

class NavigationModel {
    
    internal func getListModelVC() -> ListModelVC {
        let title = NSLocalizedString("Vertragspartner auswählen", comment: "")
        let descriptionText = NSLocalizedString("Bei wem möchtest du deine neue Anschrift hinterlegen?", comment: "")
        let titleButtonText = NSLocalizedString("Vertragspartner informieren", comment: "")
        let cell = ListCellModel(title: NSLocalizedString("Deutsche Telekom", comment: ""))
        var cells = [ListCellModel]()
        cells.append(cell)
        let cell1 = ListCellModel(title: NSLocalizedString("Techniker Krankenkasse", comment: ""))
        cells.append(cell1)
        let cell2 = ListCellModel(title: NSLocalizedString("McFit Studio ", comment: ""))
        cells.append(cell2)
        let cell3 = ListCellModel(title: NSLocalizedString("fino digital GmbH", comment: ""))
        cells.append(cell3)
        
        let model = ListModelVC(title: title, descriptionText: descriptionText, cells: cells, titleButton: titleButtonText)
        return model
    }
    
    internal func getNextAddressVCModel() -> AddressModelVC {
        let title = NSLocalizedString("Neue Anschrift", comment: "")
        let descriptionText = NSLocalizedString("Bitte gib jetzt deine neue Anschrift an:", comment: "")
        let titleButtonText = NSLocalizedString("Vertragspartner auswahlen", comment: "")
        let model = AddressModelVC(cells: nil, title: title, descriptionText: descriptionText, titleButton: titleButtonText)
        return model
    }
    
}
