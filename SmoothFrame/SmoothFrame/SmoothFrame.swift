//
//  SmoothFrame.swift
//  SmoothFrame
//
//  Created by teason23 on 2022/8/6.
//

import UIKit


public class SmoothFrameView {
    private let targetView: UIView
    
    init(_ targetView: UIView) {
        self.targetView = targetView
    }
    
    // MARK: SafeArea
    lazy var safeAreaBottomGap: CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            if superview.safeAreaLayoutGuide.layoutFrame.size.height > 0 {
                return superview.frame.size.height - superview.safeAreaLayoutGuide.layoutFrame.origin.y - superview.safeAreaLayoutGuide.layoutFrame.size.height
            } else {
                return 0
            }
        } else {
            return 0
        }
    }()

    lazy var safeAreaTopGap: CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.y
        } else {
            return 0
        }
    }()

    lazy var safeAreaLeftGap: CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.x
        } else {
            return 0
        }
    }()

    lazy var safeAreaRightGap: CGFloat = {
        guard let superview = targetView.superview else { return 0 }
        if #available(iOS 11.0, *) {
            return superview.safeAreaLayoutGuide.layoutFrame.origin.x
        } else {
            return 0
        }
    }()
}

public protocol SmoothFrameExtended {
    var sf: SmoothFrameView { get }
}

public extension SmoothFrameExtended {
    var sf: SmoothFrameView {
        get {
            return SmoothFrameView(self as! UIView)
        }
    }
}

extension UIView: SmoothFrameExtended {}

// MARK: [Basic] Size: width, height, size
public extension SmoothFrameView {
    func width() -> CGFloat {
        return targetView.frame.size.width
    }

    @discardableResult
    func setWidth(_ width: CGFloat) -> SmoothFrameView {
        targetView.frame.size.width = width
        return self
    }

    func height() -> CGFloat {
        return targetView.frame.size.height
    }

    @discardableResult
    func setHeight(_ height: CGFloat) -> SmoothFrameView {
        targetView.frame.size.height = height
        return self
    }

    func size() -> CGSize {
        return targetView.frame.size
    }

    @discardableResult
    func setSize(_ size: CGSize) -> SmoothFrameView {
        targetView.frame.size = size
        return self
    }
}

// MARK: [Basic] add width or add height
public extension SmoothFrameView {
    enum HorizontalSide {
        case left, right
    }
    enum VerticalSide {
        case top, bottom
    }
    
    @discardableResult
    func addWidth(_ widthToAdd: CGFloat, on side: SmoothFrameView.HorizontalSide) -> SmoothFrameView {
        switch side {
        case .left:
            targetView.frame.size.width += widthToAdd
            targetView.frame.origin.x -= widthToAdd
        case .right:
            targetView.frame.size.width += widthToAdd
        }
        return self
    }

    @discardableResult
    func addHeight(_ heightToAdd: CGFloat, on side: SmoothFrameView.VerticalSide) -> SmoothFrameView {
        switch side {
        case .top:
            targetView.frame.size.height += heightToAdd
            targetView.frame.origin.y -= heightToAdd
        case .bottom:
            targetView.frame.size.height += heightToAdd
        }
        return self
    }
}

// MARK: [basic] Point: (x, y, centerX, centerY, center, leftPoint, rightPoint, topPoint, bottomPoint)
public extension SmoothFrameView {
    func x() -> CGFloat {
        return targetView.frame.origin.x
    }

    @discardableResult
    func setX(_ x: CGFloat) -> SmoothFrameView {
        targetView.frame.origin.x = x
        return self
    }

    func y() -> CGFloat {
        return targetView.frame.origin.y
    }

    @discardableResult
    func setY(_ y: CGFloat) -> SmoothFrameView {
        targetView.frame.origin.y = y
        return self
    }

    func centerX() -> CGFloat {
        return targetView.center.x
    }

    @discardableResult
    func setCenterX(_ centerX: CGFloat) -> SmoothFrameView {
        targetView.center.x = centerX
        return self
    }

    func centerY() -> CGFloat {
        return targetView.center.y
    }

    @discardableResult
    func setCenterY(_ centerY: CGFloat) -> SmoothFrameView {
        targetView.center.y = centerY
        return self
    }

    func center() -> CGPoint {
        return targetView.center
    }

    @discardableResult
    func setCenter(_ center: CGPoint) -> SmoothFrameView {
        targetView.center = center
        return self
    }
    // left point absolutely
    func left() -> CGFloat {
        return targetView.frame.origin.x
    }
    // right point absolutely
    func right() -> CGFloat {
        return targetView.frame.origin.x + targetView.frame.size.width
    }
    // bottom point absolutely
    func bottom() -> CGFloat {
        return targetView.frame.origin.y + targetView.frame.size.height
    }
    // top point absolutely
    func top() -> CGFloat {
        return targetView.frame.origin.y
    }
}

// MARK: [Basic] Fill
public extension SmoothFrameView {
    @discardableResult
    func fillWidth() -> SmoothFrameView {
        guard let superview = targetView.superview else { return self }
        targetView.frame.size.width = superview.frame.size.width
        targetView.frame.origin.x = 0
        return self
    }

    @discardableResult
    func fillHeight() -> SmoothFrameView {
        guard let superview = targetView.superview else { return self }
        targetView.frame.size.height = superview.frame.size.height
        targetView.frame.origin.y = 0
        return self
    }

    @discardableResult
    func fill() -> SmoothFrameView {
        guard let superview = targetView.superview else { return self }
        let height = superview.frame.size.height - safeAreaBottomGap
        targetView.frame = CGRect(x: 0, y: 0, width: superview.frame.size.width, height: height)
        return self
    }
}

// MARK: [Relation with superView] left, right, top, bottom
/*
        ---------------------------------------------
        | superview          top                    |
        |                    gap                    |
        |          ----------------------           |
        |          |                    |           |
        |          |                    |           |
        |          |                    |           |
        |   left   |        VIEW        |   right   |
        |   gap    |                    |    gap    |
        |          |                    |           |
        |          |                    |           |
        |          ----------------------           |
        |                  bottom                   |
        |                    gap                    |
        ---------------------------------------------
 */
public extension SmoothFrameView {
    @discardableResult
    /// [Relation with superView] set top distance
    func setTop(_ top: CGFloat) -> SmoothFrameView {
        targetView.frame.origin.y = top
        return self
    }

    @discardableResult
    /// [Relation with superView] set bottom distance
    func setBottom(_ bottom: CGFloat) -> SmoothFrameView {
        guard let superview = targetView.superview else { return self }
        if height() > 0 { // stay saved height
            targetView.frame.origin.y = superview.frame.size.height - targetView.frame.size.height - bottom - safeAreaBottomGap
        } else { // changed height
            targetView.frame.size.height = superview.frame.size.height - bottom - targetView.frame.origin.y
        }
        return self
    }

    @discardableResult
    /// [Relation with superView] set left distance
    func setLeft(_ left: CGFloat) -> SmoothFrameView {
        targetView.frame.origin.x = left
        return self
    }

    @discardableResult
    /// [Relation with superView] set right distance
    func setRight(_ right: CGFloat) -> SmoothFrameView {
        guard let superview = targetView.superview else { return self }
        if width() > 0 { // stay saved width
            targetView.frame.origin.x = superview.frame.size.width - targetView.frame.size.width - right
        } else { // changed width
            targetView.frame.size.width = superview.frame.size.width - right - targetView.frame.origin.x
        }
        return self
    }
    
    @discardableResult
    /// [Relation with superView] set edges
    func setEdges(top: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil, right: CGFloat? = nil) -> SmoothFrameView {
        if let tmp = top {
            setTop(tmp)
        }
        if let tmp = bottom {
            setBottom(tmp)
        }
        if let tmp = left {
            setLeft(tmp)
        }
        if let tmp = right {
            setRight(tmp)
        }
        return self
    }
}


// MARK: [Relation with other] Center related to other view
public extension SmoothFrameView {
    @discardableResult
    func setCenterXEqual(to view: UIView?) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchSuperView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenterX(centerPoint.x)
    }

    @discardableResult
    func setCenterYEqual(to view: UIView?) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchSuperView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenterY(centerPoint.y)
    }

    @discardableResult
    func setCenterEqual(to view: UIView?) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topView = fetchSuperView()

        let viewCenterPoint = viewSuperView.convert(view.center, to:topView)
        let centerPoint = topView.convert(viewCenterPoint, to:targetView.superview)
        return setCenter(centerPoint)
    }
}

// MARK: [Relation with other] gap with other view
/*
               |                   |
               |                   |
               ---------------------
                      top gap
  ---          ---------------------           ---
    |          |                   |           |
    |          |                   |           |
    |          |                   |           |
    | left gap |        VIEW       | right gap |
    |          |                   |           |
    |          |                   |           |
    |          |                   |           |
  ---          ---------------------           ---
                    bottom gap
               ---------------------
               |                   |
               |                   |
 */
public extension SmoothFrameView {
    @discardableResult
    func setTopEqual(to view: UIView?, on side: SmoothFrameView.VerticalSide = .top, offset: CGFloat = 0) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        
        var newTop = 0.0
        if side == .top {
            newTop = newOriginPoint.y + offset
        } else if side == .bottom {
            newTop = newOriginPoint.y + offset + view.frame.size.height
        }
        setTop(newTop)
        return self
    }
    
    @discardableResult
    func setBottomEqual(to view: UIView?, on side: SmoothFrameView.VerticalSide = .bottom, offset: CGFloat = 0) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        var newBottom = 0.0
        
        if side == .bottom {
            if height() > 0 {
                newBottom = newOriginPoint.y + view.frame.size.height + offset
                setBottom(topSuperView.frame.size.height - newBottom - targetView.sf.safeAreaBottomGap)
            } else {
                self.setHeight(view.sf.height() + newOriginPoint.y + offset - targetView.frame.origin.y)
            }
        } else if side == .top {
            if height() > 0 {
                newBottom = newOriginPoint.y + offset
                setBottom(topSuperView.frame.size.height - newBottom - targetView.sf.safeAreaBottomGap)
            } else {
                self.setHeight(newOriginPoint.y + offset - targetView.frame.origin.y)
            }
        }
        return self
    }

    @discardableResult
    func setLeftEqual(to view: UIView?, on side: SmoothFrameView.HorizontalSide = .left, offset: CGFloat = 0) -> SmoothFrameView {
        guard let view = view else { return self }

        let viewSuperView = view.superview ?? view
        let topSuperView = fetchSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        var newLeft = 0.0
        if side == .left {
            newLeft = newOriginPoint.x + offset
        } else if side == .right {
            newLeft = newOriginPoint.x + offset + view.frame.size.width
        }
        setLeft(newLeft)
        return self
    }

    @discardableResult
    func setRightEqual(to view: UIView?, on side: SmoothFrameView.HorizontalSide = .right, offset: CGFloat = 0) -> SmoothFrameView {
        guard let view = view else { return self }
        
        let viewSuperView = view.superview ?? view
        let topSuperView = fetchSuperView()
        let viewOriginPoint = viewSuperView.convert(view.frame.origin, to:topSuperView)
        let newOriginPoint = topSuperView.convert(viewOriginPoint, to: targetView.superview)
        var newRight = 0.0
        
        if side == .right {
            if width() > 0 {
                newRight = newOriginPoint.x + view.frame.size.width + offset
                setRight(topSuperView.frame.size.width - newRight)
            } else {
                self.setWidth(view.sf.width() + newOriginPoint.x + offset - targetView.frame.origin.x)
            }
        } else if side == .left {
            if width() > 0 {
                newRight = newOriginPoint.x + offset
                setRight(topSuperView.frame.size.width - newRight)
            } else {
                self.setWidth(newOriginPoint.x + offset - targetView.frame.origin.x)
            }
        }
        return self
    }
}

// MARK: helper methods
public extension SmoothFrameView {
    func fetchSuperView() -> UIView {
        var result = targetView
        while result.superview != nil {
            result = result.superview ?? result
        }
        return result
    }
}

