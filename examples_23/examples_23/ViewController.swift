//
//  ViewController.swift
//  examples_23
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        
        self.testDefer()
        do{
            try self.testDeferWithThrow()
        }catch{
            print("catching \(error)")
        }
        testDeferWithOtherBlocks()
        testDeferWithThrow2()
    }
    
    let which = 0
    
    func testDefer(){
        print("statring")
        defer{
            print("ending")
        }
        
        if which == 1{
            print("returning")
            return
        }
        
        print("last line")
    }
    
    func testDeferWithThrow() throws{
            print("starting2")
        defer{
            print("ending2")
        }
        
        throw NSError(domain: "Ouch", code: 1, userInfo: nil)
    }
    
    func testDeferWithThrow2(){
        print("starting2")
        do{
            defer{
                print("ending2")
            }
            print("throwing")
            throw NSError(domain:"Ouch", code: 1, userInfo: nil)
        }catch{
            print("caught \(error)")
        }
    }
    
    func testDeferWithOtherBlocks(){
        print("entering func")
        defer{
            print("exeting func")
        }
        test: while true{
            print("entering while")
            defer{
                print("exiting while")
            }
            if which == 1{
                print("entering if")
                defer{
                    print("exiting if")
                }
                print("breaking from if")
                break test
            }
            print("breaking from while")
            break test
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

