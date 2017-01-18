//
//  ViewController.swift
//  DatabaseTestProject
//
//  Created by sazzad on 1/18/17.
//  Copyright © 2017 Dynamic Solution Innovators. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var textAge: UITextField!

    @IBOutlet weak var textId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        let person = Person()
        person.id = getCurrentMillis()
        person.name = textName.text!
        person.age = Int(textAge.text!)!
        
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
        
    }
    
    @IBAction func btnView(_ sender: UIButton) {
        let realm = try! Realm()
        let person = realm.objects(Person.self).filter("id = \(textId.text!)").first
        print(person!)
        print("id : \(person?.id), name : \(person?.name), age : \(person?.age)")
        
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        
    }
    
    @IBAction func btnList(_ sender: UIButton) {
        let realm = try! Realm()
        let personList = realm.objects(Person.self)
        print(personList.count)
        print(personList)
        
    }
    
    
}


func getCurrentMillis()->Int64{
    return  Int64(NSDate().timeIntervalSince1970 * 1000)
}





















