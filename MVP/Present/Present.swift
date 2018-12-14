//
//  Present.swift
//  mvpdemo
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit
// Present class Connection View  Model   ViewController
class Present: NSObject ,PresentProtocol{
    var dataArray:[Any]? = []
    var delegate:PresentProtocol?;

    override init() {
        super.init();
        loadData();
    }
    //MARK:- fetch data or network data
    func loadData(){
        var tmplist:[Any] = []
        for index in 0...9 {
            let model = Model.init();
            model.name = "name1\(index)";
            model.num = "1";
            tmplist.append(model);
        }
        self.dataArray = tmplist;
        
    }
    
    //MARK:- PresentProtocol
    func didClickPlusBtnAndSubtractBtn(isPlus: Bool, num: String?, indexpath: IndexPath?) {
        for i in 0...Int(self.dataArray?.count ?? 0){
            if i == indexpath?.row{
                let model:Model = self.dataArray?[i] as! Model;
                model.num = num;
                break;
            }
        }
        //num > 7 change data
        if Int(num ?? "0") ?? 0 > 7{
            var tmplist:[Any] = []
            for index in 0...3 {
                let model = Model.init();
                model.name = "name1\(index)";
                model.num = "1";
                tmplist.append(model);
            }
            self.dataArray = tmplist;
        }
        
        //go to MVPViewController refresh UI
        if (self.delegate != nil ){
            self.delegate?.reloadUI();
        }
        
        
    }
    

}
