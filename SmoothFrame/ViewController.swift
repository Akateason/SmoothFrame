//
//  ViewController.swift
//  SmoothFrame
//
//  Created by teason23 on 2022/8/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pinkView)
        pinkView.addSubview(pinkSubView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(view.sf.safeAreaBottomGap)
        pinkView.sf.setBottom(view.sf.safeAreaBottomGap).fillWidth().setHeight(99)
//        pinkSubView.hf.setInnerEdge(top: 10, bottom: 10, left: 5, right: 15)
        
    }

    lazy var pinkView : UIView = {
        let _pinkView = UIView()
        _pinkView.backgroundColor = .systemPink
        return _pinkView
    }()

    lazy var pinkSubView : UIView = {
        let _pinkSubView = UIView()
        _pinkSubView.backgroundColor = .systemBlue
        return _pinkSubView
    }()

}

