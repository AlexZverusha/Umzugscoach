//
//  Model.swift
//  Umzugscoach
//
//  Created by Alex on 26.10.17.
//  Copyright © 2017 Oleksandr Vashchenko. All rights reserved.
//


import Foundation

protocol ModelVC {
    var title: String {get set}
    var descriptionText: String {get set}
    var cells: [ListCellModel]? {get set}
    var titleButton: String {get set}
}
