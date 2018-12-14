//
//  ListTableViewCell.swift
//  mvpdemo
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    
    var titleLB:UILabel?
    var numLB:UILabel?
    var plusBtn:UIButton?
    var subtractBtn:UIButton?
    var indexPath:IndexPath?
    
    var delegate:PresentProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:-
    func initViews() -> Void {
        
        self.titleLB = UILabel.init();
        self.addSubview(titleLB!);
        
        self.numLB = UILabel.init()
        self.addSubview(self.numLB!);
        
        self.plusBtn =  UIButton.init(type: UIButton.ButtonType.custom);
        self.plusBtn?.setTitle("增加", for: .normal);
        self.plusBtn?.backgroundColor = UIColor.lightGray;
        self.addSubview(plusBtn!);
        plusBtn?.tag = 1;

        self.plusBtn?.addTarget(self, action: #selector(plusAddSubtract(sender:)), for: .touchUpInside)
        
        self.subtractBtn = UIButton.init(type: UIButton.ButtonType.custom);
        self.subtractBtn?.setTitle("减少", for: .normal);
        self.subtractBtn?.backgroundColor = UIColor.lightGray;
        subtractBtn?.tag = 2;
        self.addSubview(subtractBtn!);
        self.subtractBtn?.addTarget(self, action: #selector(plusAddSubtract(sender:)), for: .touchUpInside)

        titleLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10);
            ConstraintMaker.centerY.equalToSuperview();
        
        })
      
        plusBtn?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.right.equalTo((numLB?.snp.left)!).offset(0);
            ConstraintMaker.centerY.equalToSuperview();
            ConstraintMaker.width.equalTo(60)
            ConstraintMaker.height.equalTo(30)
        })
        numLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.right.equalTo((subtractBtn?.snp.left)!).offset(0);
            ConstraintMaker.centerY.equalToSuperview();
            ConstraintMaker.width.equalTo(60)
            
        })
        
        subtractBtn?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.right.equalToSuperview().offset(-10);
            ConstraintMaker.centerY.equalToSuperview();
            ConstraintMaker.width.equalTo(60)
            ConstraintMaker.height.equalTo(30)
            
        })
        
        
    }
    
    //MARK:- <#Description#>
   @objc func plusAddSubtract(sender:UIButton) -> Void {
    var num:Int = Int(self.numLB?.text ?? "0") ?? 0;
        if sender.tag == 2{
            //plus
            print("减少");
            if num > 0{
                num = num - 1;
            }
        }
        else if sender.tag == 1{
            //Subtract
            print("增加");
            num = num + 1;
        }
    
        // go to Present 
        if self.delegate != nil {
            self.delegate?.didClickPlusBtnAndSubtractBtn(isPlus: sender.tag == 2, num: "\(num)", indexpath: indexPath);
        }
        
    }
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
