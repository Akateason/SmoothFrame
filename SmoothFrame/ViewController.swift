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
        
        view.addSubview(yellowView)
        view.addSubview(greenView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // relation with super
        pinkView.sf.setLeft(0).setHeight(99).setBottom(0).setRight(3)
        
        // set edges
        pinkSubView.sf.setEdges(bottom: 23, left: 11, right: 50)
        
        // relation with other
        yellowView.sf.setTop(88).setWidth(300).setHeight(88).setCenterXEqual(to: view)
        print("yellow: \(yellowView.frame)")
        
        // 有bug 长宽没了, 不明原因 加了pinkView之后, 就没了
//        greenView.sf
//            .setTopEqual(to: yellowView, offset: 9)
//            .setBottomEqual(to: yellowView, on: .bottom, offset: -10)
//            .setLeftEqual(to: yellowView, on: .left, offset: 22)
//            .setRightEqual(to: yellowView)
                
//        greenView.sf.setTop(33).setLeft(33).setBottom(33).setRight(34)
        print("green: \(greenView.frame)")
        print("---------\n")
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
    
    lazy var yellowView : UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var greenView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()


}

