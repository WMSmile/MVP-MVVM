//
//  CustomProtocol.swift
//  mvpdemo
//
//  Created by apple on 2018/12/14.
//  Copyright © 2018 wumeng. All rights reserved.
//

import UIKit

protocol PresentProtocol {
    func didClickPlusBtnAndSubtractBtn(isPlus:Bool,num:String?,indexpath:IndexPath?);
    func reloadUI();
}
extension PresentProtocol{
    func didClickPlusBtnAndSubtractBtn(isPlus:Bool,num:String?,indexpath:IndexPath?){}
    func reloadUI(){}

}
