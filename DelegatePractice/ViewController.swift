//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Sylvia Jia Fen  on 2019/8/19.
//  Copyright © 2019 Sylvia Jia Fen . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        topSelectionView.dataSource = self
        
        topSelectionView.delegate = self
        
        topSelectionView.backgroundColor = .black
        
        belowSelectionView.dataSource = self
        
        belowSelectionView.delegate = self
        
        belowSelectionView.backgroundColor = .black
        
        view.addSubview(topSelectionView)
        
        view.addSubview(belowSelectionView)
        
        topColorView.frame = CGRect(x: 0, y: topSelectionView.frame.height + 5, width: UIScreen.main.bounds.width, height: 120)
        
        topColorView.backgroundColor = .red
        
        belowColorView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height/2.0 + belowSelectionView.frame.height + 5, width: UIScreen.main.bounds.width, height: 120)
        
        belowColorView.backgroundColor = .red
        
        view.addSubview(topColorView)
        
        view.addSubview(belowColorView)

    }

    
    let topSelectionView = SelectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60.0))
    
    let belowSelectionView = SelectionView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2.0, width: UIScreen.main.bounds.width, height: 60.0))
    
    let topColorView = UIView()
    
    let belowColorView = UIView()
   
    let topBtnArr = ["Red", "Yellow"]
    
    let belowBtnArr = ["Red", "Yellow", "Blue"]
    
}

extension ViewController: SelectionViewDataSource {
    
    func selectionQty(_ view: SelectionView) -> Int {
        
        if view == topSelectionView {
            
            return topBtnArr.count
            
        } else {
            
            return belowBtnArr.count
        }
    }
    
    func selectionText(_ view: SelectionView) -> [String] {
        
        if view == topSelectionView {
            
            return topBtnArr
            
        } else {
            
            return belowBtnArr
        }
    }
   
}

extension ViewController: SelectionViewDelegate {
    
    
    func didSelectAt(_ index: Int,_ selection: UIButton,_ view: SelectionView)  {
        
        if view == topSelectionView {
            
            if index == topBtnArr.count - 1 {
                
                print("final")
                
                topColorView.backgroundColor = .yellow
                
//                let btnBelowCount = selectionQty(belowSelectionView)
//
//                for index in 0..<btnBelowCount {
//
//                    canSelectBtn(at: index, belowSelectionView)
//                }
                
            } else {
                
                topColorView.backgroundColor = .red
                
//                let btnBelowCount = selectionQty(belowSelectionView)
//
//                for index in 0..<btnBelowCount {
//
//                    enableSelection(at: index, belowSelectionView)
//                }
                
            }
        }
        
        
        if view == belowSelectionView {
            
            if index == 0 {
                
                belowColorView.backgroundColor = .red
                
            } else if index == 1 {
                
                belowColorView.backgroundColor = .yellow
            
            } else if index == 2 {
                
                belowColorView.backgroundColor = .blue
            }
            
            
        }
    }
    
    
    func canSelectBtn(at: Int, _ view: SelectionView) -> Bool {
    
        if view == topSelectionView {
            
            return true
            
        } else if view == belowSelectionView {
            
            if topSelectionView.selectedTag == topBtnArr.count - 1 {
    
                return false
                
            } else {
                
                return true
            }
            
        } else {
            
            return true
            
        }
    }
    
}

