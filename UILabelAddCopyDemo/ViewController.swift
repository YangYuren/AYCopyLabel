//
//  ViewController.swift
//  UILabelAddCopyDemo
//
//  Created by Yang on 2018/8/25.
//  Copyright © 2018年 Tucodec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let label = AYCopyLabel(frame: CGRect(x: 20, y: 50, width: 150, height: 40))
        label.backgroundColor = UIColor.gray
        label.textColor = UIColor.yellow
        label.text = "这是一个测试哦"
        view.addSubview(label)
        
        
    }


}

