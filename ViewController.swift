//
//  ViewController.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func MVPClick(_ sender: Any) {
        print("go to mvp")
        let vc = MVPViewController();
        self.navigationController?.pushViewController(vc, animated: true);
        
    }
    @IBAction func MVVMClick(_ sender: Any) {
        print("go to mvvm")
        let vc = MVVMViewController();
        self.navigationController?.pushViewController(vc, animated: true);

    }
    

}

