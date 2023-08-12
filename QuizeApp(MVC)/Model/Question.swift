//
//  Quection.swift
//  QuizeApp(MVC)
//
//  Created by Ashraf Eltantawy on 12/08/2023.
//

import Foundation
struct Question {
    var text:String
    var answer:String
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
