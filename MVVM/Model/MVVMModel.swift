//
//  MVVMModel.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

class MVVMModel: NSObject {
    var name:String?;

    init(_ name:String?) {
        super.init();
        self.name = name;
    }
    
}
