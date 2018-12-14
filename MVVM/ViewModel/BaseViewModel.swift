//
//  BaseViewModel.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

typealias SuccessBlock = (_ data:Any)->Void
typealias FailBlock = (_ data:Any)->Void


class BaseViewModel: NSObject {
    var successBlock:SuccessBlock?
    var failBlock:FailBlock?
    
   

    func initWith(successBlock:@escaping SuccessBlock,failBlock:@escaping FailBlock) {
        self.successBlock = successBlock;
        self.failBlock = failBlock;
    }
    
    
    

}
