//
//  MVVMTableViewCell.swift
//  MVP-MVVM
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

class MVVMTableViewCell: UITableViewCell {
    
    var titleLB:UILabel?
    var indexPath:IndexPath?

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
        
        titleLB?.snp.makeConstraints({ (ConstraintMaker) in
            ConstraintMaker.left.equalToSuperview().offset(10);
            ConstraintMaker.centerY.equalToSuperview();
            
        })
        
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
