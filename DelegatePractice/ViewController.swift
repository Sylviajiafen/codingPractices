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
    
        view.backgroundColor = .yellow
        
        selectionView.dataSource = self
        
        selectionView.delegate = self
        
        selectionView.backgroundColor = .black
    
        
        view.addSubview(selectionView)

    }

    let selectionView = SelectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80.0))

}

extension ViewController: SelectionViewDataSource {
   
}

extension ViewController: SelectionViewDelegate {
    
}

