//
//  LegalSwift.swift
//  example_1
//
//  Created by Artem Cherkasov on 8/10/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

var one = 1

func changeOne(){
    let two = 2
    func sayTwo(){
        print(two)
    }
    
    class Klass{}
    struct Struct{}
    enum Enum{}
    one = two
}

class Many{
    let name="manny"
    func sayName(){
        print(name)
    
    }
    class Klass{}
    struct Struct{}
    enum Enum{}
}


struct Moe{
    let name="moe"
    func sayName(){
        print(name)
        
    }
    class Klass{}
    struct Struct{}
    enum Enum{}
}

enum Jack {
    var name:String{
        return "jack"
    }
    
    func sayName(){
        print(name)
        
    }
    class Klass{}
    struct Struct{}
    enum Enum{}
}