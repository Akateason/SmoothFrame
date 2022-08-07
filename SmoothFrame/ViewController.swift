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
        
        view.addSubview(greenView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        pinkView.sf.fillWidth().setHeight(99).setBottom(view.sf.safeAreaBottomGap).setRight(3)
//        pinkSubView.hf.setInnerEdge(top: 10, bottom: 10, left: 5, right: 15)
                
        greenView.sf.setWidth(200).setHeight(222).setRightEqual(to: pinkView, offset: 21)
//        print(greenView.frame)
        
        
        
        
        
        
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
    
    lazy var greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

//    lazy var pinkSubView : UIView = {
//        let _pinkSubView = UIView()
//        _pinkSubView.backgroundColor = .systemBlue
//        return _pinkSubView
//    }()
}

