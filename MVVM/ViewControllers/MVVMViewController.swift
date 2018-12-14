//
//  MVVMViewController.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

class MVVMViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    
    
    var listTableView: UITableView!
    let identifierstr = "listtableviewcell1"
    var listArray:[MVVMModel]? = [MVVMModel.init("小狗"),MVVMModel.init("小猫"),MVVMModel.init("小鹿"),MVVMModel.init("小熊猫")]
    var vm:MVVMViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //init UITableView
        self.listTableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain);
        self.view.addSubview(self.listTableView);
        self.listTableView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalToSuperview();
        }
        self.listTableView.register(MVVMTableViewCell.self, forCellReuseIdentifier: identifierstr)
        
        self.listTableView.dataSource = self;
        self.listTableView.delegate = self;
        
        self.vm = MVVMViewModel()
        self.vm?.initWith(successBlock: {[unowned self] (data) in
            let data:[MVVMModel] = data as! [MVVMModel]
            self.listArray = data;
            self.listTableView.reloadData();
            
        }, failBlock: { (data) in
            
        })
        
        self.vm?.loadData();//refresh data 

    }
    

    //MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MVVMTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifierstr, for: indexPath) as! MVVMTableViewCell;
        cell.titleLB?.text = self.listArray?[indexPath.row].name;
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false);
        self.vm?.contentModel = self.listArray?[indexPath.row];
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
