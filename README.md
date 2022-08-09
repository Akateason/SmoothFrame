# SmoothFrame
# [WIP] 

## SmoothFrame是一种关系型的frame布局.
## 顺滑的给UI布局, 写法类似SnapKit. 并且无序关注讨厌的autoLayout约束警告. 
## 支持链式调用.
## 由于SmoothFrame是基于frame的布局系统, 所以在任何场景都可以直接修改view的布局, frame会直接覆盖.
## 由于frame绝对定位的特性, 注意setFrame的最佳时机是VC.viewWillLayoutSubviews() 和 view.layoutSubViews() .


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
## 1. 和SuperView的关系
```swift
        // 1.1 Relation with super
        pinkView.sf.setLeft(0).setHeight(99).setBottom(0).setRight(3)
        
        // 1.2 set edges
        pinkSubView.sf.setEdges(top: 2, bottom: 23, left: 11, right: 50)
        
        
```

## 2. 和其他任意View的关系

```swift
        //2 relation with other
        yellowView.sf.setTop(100).setWidth(300).setHeight(88).setCenterXEqual(to: view)
        
        greenView.sf
            .setTopEqual(to: yellowView, offset: 20)
            .setBottomEqual(to: yellowView, on: .bottom, offset: -10)
            .setLeftEqual(to: yellowView, on: .left, offset: -12)
            .setRightEqual(to: yellowView, on: .right, offset: 22)
        
```



# 基础方法 
