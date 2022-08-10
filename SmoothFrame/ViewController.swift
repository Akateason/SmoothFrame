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
        view.addSubview(purpleView)
        
        view.addSubview(orangeView)
        view.addSubview(cyanView)
        
        view.addSubview(blueView)
        view.addSubview(redView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // 1.1 Relation with super
        pinkView.sf.setLeft(0).setHeight(99).setBottom(0).setRight(3)
        print("pink: \(pinkView.frame)")
        // 1.2 set edges
        pinkSubView.sf.setEdges(top: 2, bottom: 23, left: 111, right: 50)
        print("pinksub: \(pinkSubView.frame)")
        
        //2 relation with other
        yellowView.sf.setTop(100).setWidth(300).setHeight(88).setCenterXEqual(to: view)
        print("yellow: \(yellowView.frame)")
        
        greenView.sf
            .setTopEqual(to: yellowView, offset: 20)
            .setBottomEqual(to: yellowView, on: .bottom, offset: -10)
            .setLeftEqual(to: yellowView, on: .left, offset: -12)
            .setRightEqual(to: yellowView, on: .right, offset: 22)
        print("green: \(greenView.frame)")
        
        purpleView.sf.setSize(CGSize(width: 100, height: 100)).setCenterXEqual(to: pinkSubView).setCenterYEqual(to: greenView)
        print("purple: \(purpleView.frame)")
                
        // 3 fill
        orangeView.sf.fillWidth().setHeight(55).setCenterYEqual(to: view)
        print("orange: \(orangeView.frame)")
        
        // 4 add width or add height
        cyanView.frame = yellowView.frame
        cyanView.sf.addWidth(11, on: .right).addWidth(9, on: .left).addHeight(11, on: .bottom).setTopEqual(to: yellowView, on: .bottom, offset: 10)
        print("cyan: \(cyanView.frame)")
        
        // 5 basic
        blueView.sf.setSize(CGSize(width: 99, height: 33)).setCenter(CGPoint(x: 137, y: 69))
        redView.sf.setX(134).setY(39).setWidth(64).setHeight(64)
        print("blue: \(blueView.frame)")
        print("red: \(redView.frame)")
        
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
    
    lazy var purpleView : UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    lazy var orangeView : UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var cyanView : UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    lazy var blueView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var redView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
}

