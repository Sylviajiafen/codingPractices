//
//  SelectionView.swift
//  DelegatePractice
//
//  Created by Sylvia Jia Fen  on 2019/8/19.
//  Copyright © 2019 Sylvia Jia Fen . All rights reserved.
//

import UIKit

class SelectionView: UIView {
    
    weak var dataSource: SelectionViewDataSource? {
        
        didSet {
            
            addIndiCator()
            
            addBtn()

        }
    }
    
    weak var delegate: SelectionViewDelegate? {
        
        didSet {
            
            
        }
    }
    
    @objc func touchBtn(sender: UIButton) {
        
        indicatorView.frame.origin.x = sender.frame.origin.x
    
        self.delegate?.didSelectAt(sender)
    }
    
    func addBtn() {
        
        guard let dataSource = self.dataSource else {return}
        
        let btnCount = dataSource.selectionQty()
        
        for number in 0..<btnCount {
            
            let btnWidth = self.frame.width / CGFloat(btnCount)
            
            
            let button = UIButton(frame: CGRect(x: btnWidth * CGFloat(number), y: 0, width: btnWidth, height: 78.0))
            
            button.setTitle(dataSource.selectionText()[number], for: .normal)
            
            button.titleLabel?.font = dataSource.selectionTextFont()
            
            button.setTitleColor(dataSource.selectionTextColor(), for: .normal)
            
            button.backgroundColor = .black
            
            button.addTarget(self, action: #selector(touchBtn(sender:)), for: .touchUpInside)
            
            self.addSubview(button)
            
            self.bringSubviewToFront(button)

        }
        
    }
    
    
    func addIndiCator() {
        
        guard let dataSource = self.dataSource else {return}
        
        indicatorView.backgroundColor = dataSource.indicatorColor()
        
        indicatorView.frame = CGRect(x: 0, y: 80, width: selectionWidth/dataSource.selectionQty(), height: 2)
        
        self.addSubview(indicatorView)
    }

    let indicatorView = UIView()
    
    let selectionWidth = Int(UIScreen.main.bounds.width)
    
    
}

protocol SelectionViewDataSource: AnyObject {
    
    func indicatorColor() -> UIColor
    
    func selectionTextColor() -> UIColor
    
    func selectionTextFont() -> UIFont
    
    func selectionText() -> [String]
    
    func selectionQty() -> Int
    

}

// default settings
extension SelectionViewDataSource {

    func indicatorColor() -> UIColor {
        return .blue
    }
    
    func selectionTextColor() -> UIColor {
        return .white
    }
    
    func selectionTextFont() -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    func selectionText() -> [String] {
        
        return ["Red", "Yellow", "blue"]
    }
    
    func selectionQty() -> Int {
        return 3
    }

}

protocol SelectionViewDelegate: AnyObject {
    
    func didSelectAt(_ selection: UIButton)
    
    func enableSelection(_ selection: UIButton) -> Bool
}

extension SelectionViewDelegate {
    
    func didSelectAt(_ selection: UIButton) {
        
        print("點擊")
        
    }
    
    func enableSelection(_ selection: UIButton) -> Bool {
        return true
    }
    
}
