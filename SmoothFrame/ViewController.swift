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
        pinkView.sf.setLeft(0).setHeight(99).setBottom(view.sf.safeAreaBottomGap).setRight(3) //
//        pinkView.sf.setLeft(0).setBottom(view.sf.safeAreaBottomGap).setRight(3).setHeight(99) // 这个有bug, 调用顺序的bug, 因为frame会覆盖
        
        // set edges
        pinkSubView.sf.setEdges(bottom: 23, left: 11, right: 50) // 完美
        
        yellowView.sf.setTop(88).setWidth(300).setHeight(88).setCenterXEqual(to: view)
        
        // relation with other
//        greenView.sf.setWidth(200).setHeight(42).setRightEqual(to: yellowView, offset: 21).setTopEqual(to: yellowView, on: .bottom, offset: 14)
//        greenView.sf.setWidth(200).setHeight(42).setRightEqual(to: yellowView, offset: 21).setTopEqual(to: yellowView, on: .top, offset: 14)
//        greenView.sf.setWidth(200).setHeight(42).setRightEqual(to: yellowView, offset: 21).setBottomEqual(to: yellowView, on: .bottom, offset: 10)
//        greenView.sf.setWidth(200).setHeight(42).setRightEqual(to: yellowView, offset: 21).setBottomEqual(to: yellowView, on: .top, offset: 10)
//        greenView.sf.setWidth(200).setHeight(42).setRightEqual(to: yellowView, on: .left, offset: 22).setBottomEqual(to: yellowView, on: .top, offset: 10)
        greenView.sf.setWidth(200).setHeight(42).setLeftEqual(to: yellowView, on: .right, offset: 22).setBottomEqual(to: yellowView, on: .top, offset: 10)     
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

