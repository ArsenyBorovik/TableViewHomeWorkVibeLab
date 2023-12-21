//
//  DataManager.swift
//  TableViewHomeWorkVibeLab
//
//  Created by Арсений on 12/20/23.
//

import Foundation

class DataManager {
    
    /// Сингл тон (для заполнения данным в VC)
    static var shared = DataManager()
    
    /// Метод для заполнения массива
    /// - Returns: [Friends]
    func obtainFriends() -> [Friend] {
        let friend1 = Friend(firstName: "Vlad", lastName: "Skuratov", age: "18", sex: "Male", school: "LETI", cellPhoneNumber: "12345", email: "skuratovEmail")
        let friend2 = Friend(firstName: "George", lastName: "Efimenko", age: "18", sex: "Male", school: "LETI", cellPhoneNumber: "6789", email: "georgeEmail")
        let friend3 = Friend(firstName: "Leo", lastName: "Ostrovsky", age: "18", sex: "Male", school: "LETI", cellPhoneNumber: "7777", email: "leoEmail")
        let friend4 = Friend(firstName: "Alina", lastName: "One", age: "18", sex: "Female", school: "LETI", cellPhoneNumber: "7777", email: "leoEmail")
        let friend5 = Friend(firstName: "Ksenia", lastName: "Two", age: "18", sex: "Female", school: "LETI", cellPhoneNumber: "7777", email: "leoEmail")
        let friend6 = Friend(firstName: "Vicky", lastName: "Thee", age: "18", sex: "Female", school: "LETI", cellPhoneNumber: "7777", email: "leoEmail")
        let friend7 = Friend(firstName: "Anna", lastName: "Four", age: "18", sex: "Female", school: "LETI", cellPhoneNumber: "7777", email: "leoEmail")
        
        return [friend1, friend2, friend3, friend4, friend5, friend6, friend7]
    }
}
