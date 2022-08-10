# SmoothFrame

- SmoothFrame是一种关系型的frame布局.
- 顺滑的给UI布局, 写法类似SnapKit. 并且无需关注讨厌的autoLayout约束警告. 
- 支持链式调用.
- 由于SmoothFrame是基于frame的布局系统, 所以在任何场景都可以直接修改view的布局, frame会直接覆盖.
- 由于frame绝对定位的特性, 注意setFrame的最佳时机是VC.viewWillLayoutSubviews() 和 view.layoutSubViews() .


![图片](https://github.com/Akateason/SmoothFrame/blob/master/shot.png "shot")


```swift
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(pinkView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
                
        pinkView.sf.setLeft(0).setHeight(99).setBottom(0).setRight(3)
    }
```

# 关系型布局
## 和SuperView的关系
```swift
    // 1.1 Relation with super
    pinkView.sf.setLeft(0).setHeight(99).setBottom(0).setRight(3)
        
    // 1.2 set edges
    pinkSubView.sf.setEdges(top: 2, bottom: 23, left: 111, right: 50)        
        
```

## 和其他任意View的关系

```swift
    //2 relation with other
    yellowView.sf.setTop(100).setWidth(300).setHeight(88).setCenterXEqual(to: view)
        
    greenView.sf
            .setTopEqual(to: yellowView, offset: 20)
            .setBottomEqual(to: yellowView, on: .bottom, offset: -10)
            .setLeftEqual(to: yellowView, on: .left, offset: -12)
            .setRightEqual(to: yellowView, on: .right, offset: 22)
    
    purpleView.sf.setSize(CGSize(width: 100, height: 100)).setCenterXEqual(to: pinkSubView).setCenterYEqual(to: greenView)
        
```


# 填充满SuperView

```swift                
    orangeView.sf.fillWidth()
    orangeView.sf.fillHeight()
    orangeView.sf.fill()
```


# 拉伸宽高

```swift
    cyanView.frame = yellowView.frame
    cyanView.sf.addWidth(11, on: .right).addWidth(9, on: .left).addHeight(11, on: .bottom)
```


# 基础方法 绝对定位

```swift
    blueView.sf
    .setSize(CGSize(width: 99, height: 33))
    .setCenter(CGPoint(x: 137, y: 69))
    
    redView.sf
    .setX(134)
    .setY(39)
    .setWidth(64)
    .setHeight(64)
```

