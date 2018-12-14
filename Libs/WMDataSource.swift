//
//  WMDataSource.swift
//  mvpdemo
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

typealias WMDataSourceBlock = (_ cell:Any , _ item:Any? , _ indexPath:IndexPath) -> Void;
typealias WMDidSelectCellBlock = (_ indexPath:IndexPath) -> Void;


class WMDataSource: NSObject ,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource{

    var tableView:UITableView?;
    var items:[Any]? = [];
    var identifier:String?;
    var datasourceBlock:WMDataSourceBlock? = nil;
    var selectBlock:WMDidSelectCellBlock? = nil;

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(identifier:String,datasource:@escaping WMDataSourceBlock) {
        super.init()
        self.identifier = identifier;
        self.datasourceBlock = datasource;
        
    }
    init(identifier:String,datasource:@escaping WMDataSourceBlock,_ didSelectCell:@escaping WMDidSelectCellBlock) {
        super.init()
        self.identifier = identifier;
        self.datasourceBlock = datasource;
        self.didSelectCell(didSelectCell)
    }
    func didSelectCell(_ block:@escaping WMDidSelectCellBlock){
        self.selectBlock = block;
    }
    
    
    //MARK:- 添加数据
    func addDatas(_ list:[Any]?) -> Void {
        guard list?.count ?? 0 > 0 else {
            return;
        }
        if self.items?.count ?? 0 >= 1{
            self.items?.removeAll();
        }
        list?.forEach({ (item) in
            self.items?.append(item);
        })
    }

   
    func modelsAtIndexPath(indexpath:IndexPath) -> Any?{
        return (self.items?.count ?? 0 > indexpath.row) ? self.items?[indexpath.row]:nil
    }
    
    
    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier ?? "item");
        if(self.datasourceBlock != nil){
            self.datasourceBlock!(cell as Any,self.modelsAtIndexPath(indexpath: indexPath),indexPath);
        };
        return cell!;
    }
    //MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier ?? "collectioncell", for: indexPath);
        if(self.datasourceBlock != nil){
            self.datasourceBlock!(cell as Any,self.modelsAtIndexPath(indexpath: indexPath),indexPath);
        };
        return cell;
        
    }
    
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false);
        if(self.selectBlock != nil){
            self.selectBlock!(indexPath)
        }
        
    }
    
    //MARK:- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false);
        if(self.selectBlock != nil){
            self.selectBlock!(indexPath)
        }
    }

    

}
