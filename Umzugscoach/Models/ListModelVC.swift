//
//  ListModel.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//

import Foundation

struct ListModelVC: ModelVC {
    var title: String
    var descriptionText: String
    var cells: [ListCellModel]?
    var titleButton: String
}


struct ListCellModel {
    var title: String
}

