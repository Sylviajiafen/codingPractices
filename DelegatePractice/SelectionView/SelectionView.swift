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
    
        self.delegate?.didSelectAt(sender, self)
        
    }
    
    func addBtn() {
        
        guard let dataSource = self.dataSource else {return}
        
        let btnCount = dataSource.selectionQty(self)
        
        for number in 0..<btnCount {
            
            let btnWidth = self.frame.width / CGFloat(btnCount)
            
            let viewHeight = self.frame.height
            
            let button = UIButton(frame: CGRect(x: btnWidth * CGFloat(number), y: 0, width: btnWidth, height: viewHeight - 2))
            
            button.setTitle(dataSource.selectionText(self)[number], for: .normal)
            
            button.titleLabel?.font = dataSource.selectionTextFont(self)
            
            button.setTitleColor(dataSource.selectionTextColor(self), for: .normal)
            
            button.backgroundColor = .black
            
            btnArr.append(button)
        
            for btn in btnArr {
                
                self.addSubview(btn)

                if btn.isEnabled == true {
                    
                    btn.addTarget(self, action: #selector(touchBtn(sender:)), for: .touchUpInside)
                }
            }
            

        }
        
    }
    
    
    func addIndiCator() {
        
        guard let dataSource = self.dataSource else {return}
        
        indicatorView.backgroundColor = dataSource.indicatorColor(self)
        
        indicatorView.frame = CGRect(x: 0, y: Int(self.frame.height), width: selectionWidth/dataSource.selectionQty(self), height: 4)
        
        self.addSubview(indicatorView)
    }

    let indicatorView = UIView()
    
    let selectionWidth = Int(UIScreen.main.bounds.width)
    
    var btnArr: [UIButton] = []
    
//    func unableBtn(at: Int) {
//
//        btnArr[at].isEnabled = self.delegate?.unableSelection(at: at, self) ?? false
//    }
    
    
}

protocol SelectionViewDataSource: AnyObject {
    
    func indicatorColor(_ view: SelectionView) -> UIColor
    
    func selectionTextColor(_ view: SelectionView) -> UIColor
    
    func selectionTextFont(_ view: SelectionView) -> UIFont
    
    func selectionText(_ view: SelectionView) -> [String]
    
    func selectionQty(_ view: SelectionView) -> Int
    

}

// default settings
extension SelectionViewDataSource {

    func indicatorColor(_ view: SelectionView) -> UIColor {
        return .blue
    }
    
    func selectionTextColor(_ view: SelectionView) -> UIColor {
        return .white
    }
    
    func selectionTextFont(_ view: SelectionView) -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    func selectionText(_ view: SelectionView) -> [String] {
        
        return ["Red", "Yellow", "blue"]
    }
    
    func selectionQty(_ view: SelectionView) -> Int {
        return 3
    }

}

protocol SelectionViewDelegate: AnyObject {
    
    func didSelectAt(_ selection: UIButton,_ view: SelectionView)
    
    func unableSelection(at: Int,_ view: SelectionView)
    
    func enableSelection(at: Int,_ view: SelectionView)
}

extension SelectionViewDelegate {
    
    func didSelectAt(_ selection: UIButton,_ view: SelectionView) {
        
        print("點擊")
        
    }
    
    func unableSelection(at: Int,_ view: SelectionView) {
        
        view.btnArr[at].isEnabled = false
        
    }
    
    func enableSelection(at: Int,_ view: SelectionView) {
        
        view.btnArr[at].isEnabled = true
        
    }
}
