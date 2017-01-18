//
//  Person.swift
//  DatabaseTestProject
//
//  Created by sazzad on 1/18/17.
//  Copyright © 2017 Dynamic Solution Innovators. All rights reserved.
//

import Foundation
import RealmSwift

class Person : Object {
    dynamic var id : Int64 = 0
    dynamic var name : String = ""
    dynamic var age : Int = 0
}
