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
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(person)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func btnView(_ sender: UIButton) {
        do {
            let realm = try Realm()
            let person = realm.objects(Person.self).filter("id = \(textId.text!)").first
            print(person!)
            print("id : \(person?.id), name : \(person?.name), age : \(person?.age)")
        } catch {
            print(error.localizedDescription)
        }

        
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        let person = Person()
        person.id = Int64(textId.text!)!
        person.name = textName.text!
        person.age = Int(textAge.text!)!
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(person, update: true)
            }
        } catch {
            print(error.localizedDescription)
        }

        
        
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        do {
            let realm = try Realm()
            let person = realm.objects(Person.self).filter("id = \(textId.text!)").first
            try realm.write {
                realm.delete(person!)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func btnList(_ sender: UIButton) {
        //let personList = realm.objects(Person.self).sorted(byKeyPath:ascending: "id")
        do {
            let realm = try Realm()
            let personList = realm.objects(Person.self).sorted(byProperty: "id", ascending: false)
            print(personList.count)
            print(personList)
        } catch {
            print(error.localizedDescription)
        }

        
    }
    
    
    
    
    
}


func getCurrentMillis()->Int64{
    return  Int64(NSDate().timeIntervalSince1970 * 1000)
}





















