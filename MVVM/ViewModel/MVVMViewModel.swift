//
//  MVVMViewModel.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit
//data
class MVVMViewModel: BaseViewModel {
    var dataArray:[MVVMModel]? = []
    var contentModel:MVVMModel?{
        didSet{
            self.dataRefresh();
        }
        
    }
    
    override init() {
        super.init();
        //add observer
        self.addObserver(self, forKeyPath: "dataArray", options: .new, context: nil);
    }
    
    func loadData(){
        //delay data
        DispatchQueue.global().async {
            sleep(1);
            self.dataArray = [MVVMModel.init("小明"),MVVMModel.init("笑话"),MVVMModel.init("小刘"),MVVMModel.init("开心")];
            DispatchQueue.main.async {
                //main
                if (self.successBlock != nil) {
                    self.successBlock!(self.dataArray ?? []);
                }
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "dataArray" {
            print("\(change![NSKeyValueChangeKey.newKey]!)");
            if successBlock != nil{
                self.successBlock!(change![NSKeyValueChangeKey.newKey]!);
            }
        }
    }
    
    //MARK:- <#Description#>
    func dataRefresh() -> Void {
        if (self.contentModel != nil) {
            for item in self.dataArray?.enumerated() ?? [].enumerated(){
                if(item.element.name == contentModel?.name){
                    dataArray?.remove(at: item.offset);
                }
            }
            if successBlock != nil{
                self.successBlock!(self.dataArray!);
            }
            
        }
    }
    
    

    deinit {
        self.removeObserver(self, forKeyPath: "dataArray")
    }
}
