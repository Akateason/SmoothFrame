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
        
        // relation with super
        pinkView.sf.setLeft(0).setHeight(99).setBottom(view.sf.safeAreaBottomGap).setRight(3) //
//        pinkView.sf.setLeft(0).setBottom(view.sf.safeAreaBottomGap).setRight(3).setHeight(99) // 这个有bug, 调用顺序的bug, 因为frame会覆盖
        
        // set edges
        pinkSubView.sf.setEdges(bottom: 23, left: 11, right: 50) // 完美
        
        // relation with other
        greenView.sf.setWidth(200).setHeight(222).setRightEqual(to: pinkView, offset: 21).setBottomEqual(to: pinkView, offset: 33)
        // setBottomEqual 要针对边而言.
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


}

