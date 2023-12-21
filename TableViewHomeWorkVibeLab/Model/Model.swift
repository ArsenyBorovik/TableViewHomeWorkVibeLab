//
//  Model.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import Foundation
import UIKit

/// Просто моделька для данных
struct Friend: Hashable, Identifiable {
    
    var id: UUID = UUID()
    let firstName: String
    let lastName: String
    let age: String
    let sex: String
    let school: String
    let cellPhoneNumber: String
    let email: String
}
