//
//  Task.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var createdAt = Date()
}
