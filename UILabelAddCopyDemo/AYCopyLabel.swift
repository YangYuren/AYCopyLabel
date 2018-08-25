//
//  AYCopyLabel.swift
//  UILabelAddCopyDemo
//
//  Created by Yang on 2018/8/25.
//  Copyright © 2018年 Tucodec. All rights reserved.
//

import UIKit

class AYCopyLabel: UILabel {

    //重载父类初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        pressAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func pressAction() {
        isUserInteractionEnabled = true
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(recognizer:)))
        addGestureRecognizer(longPress)
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(customCopy){
            return true
        }
        return false
    }
}
extension AYCopyLabel {
    @objc fileprivate func longPressAction(recognizer: UIGestureRecognizer) {
        if recognizer.state == .began {
            becomeFirstResponder()
            let copyItem = UIMenuItem(title: "拷贝", action: #selector(customCopy))
            let menuVC = UIMenuController.shared
            menuVC.menuItems = [copyItem]
            menuVC.setTargetRect(frame, in: self.superview ?? UIView())
            menuVC.setMenuVisible(true, animated: true)
        }
    }
    
    @objc fileprivate func customCopy() {
        let pasteboard = UIPasteboard()
        pasteboard.string = text
    }
}
