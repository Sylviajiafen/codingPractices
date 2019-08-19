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
   
    
}

extension ViewController: SelectionViewDataSource {
    
    func selectionQty(_ view: SelectionView) -> Int {
        
        if view == topSelectionView {
            
            return 2
            
        } else {
            
            return 3
        }
    }
    
    func selectionText(_ view: SelectionView) -> [String] {
        
        if view == topSelectionView {
            
            return ["Red", "Yellow"]
            
        } else {
            
            return ["Red", "Yellow", "Blue"]
        }
    }
   
}

extension ViewController: SelectionViewDelegate {
    
    func didSelectAt(_ selection: UIButton, _ view: SelectionView) {
        
        if view == topSelectionView {
            
            let btnCount = view.btnArr.count
            
            if selection == view.btnArr[btnCount - 1] {
                
                print("final")
                
                topColorView.backgroundColor = .yellow
                
                let belowView = belowSelectionView
                
                let btnBelowCount = belowView.btnArr.count
                
                for index in 0..<btnBelowCount {
                
                    unableSelection(at: index, belowView)
                }
                
            } else {
                
                topColorView.backgroundColor = .red
                
                let belowView = belowSelectionView
                
                for btn in belowView.btnArr {
                    
                    btn.isEnabled = true
                }
                
            }
        }
        
        
        if view == belowSelectionView {
            
            if selection == view.btnArr[0] {
                
                belowColorView.backgroundColor = .red
                
            } else if selection == view.btnArr[1] {
                
                belowColorView.backgroundColor = .yellow
            
            } else if selection == view.btnArr[2] {
                
                belowColorView.backgroundColor = .blue
            }
            
            
        }
    }
    
}

