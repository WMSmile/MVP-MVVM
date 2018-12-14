//
//  MVPViewController.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

class MVPViewController: UIViewController ,PresentProtocol{
    
    var listTableView: UITableView!
    let identifierstr = "listtableviewcell"
    var datasource:WMDataSource?
    var present:Present?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //init UITableView
        self.listTableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain);
        self.view.addSubview(self.listTableView);
        self.listTableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview();
        }
        self.listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: identifierstr)
        //init present datasource
        self.present = Present.init();
        self.present?.delegate = self;
        
        self.datasource = WMDataSource.init(identifier: identifierstr, datasource: {[unowned self] (cell, model, indexpath) in
            let cell:ListTableViewCell = cell as! ListTableViewCell;
            if model != nil {
                let model:Model = model as! Model;
                cell.numLB?.text = model.num ?? "";
                cell.titleLB?.text = model.name ?? "";
            }
            cell.indexPath = indexpath;
            cell.delegate = self.present;
        }, { (indexpath) in
            print("点击了第\(indexpath)行")
        })
        self.datasource?.addDatas(self.present?.dataArray);//初始化数据
        
        self.listTableView.dataSource = self.datasource;
        self.listTableView.delegate = self.datasource;
        
        
        
    }
    //MARK:- PresentProtocol
    func reloadUI() {
        self.datasource?.addDatas(self.present?.dataArray);
        self.listTableView.reloadData();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
