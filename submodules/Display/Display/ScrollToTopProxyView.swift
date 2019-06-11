import UIKit

class ScrollToTopView: UIScrollView, UIScrollViewDelegate {
    var action: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.delegate = self
        self.scrollsToTop = true
        if #available(iOSApplicationExtension 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            let frame = self.frame
            self.contentSize = CGSize(width: frame.width, height: frame.height + 1.0)
            self.contentOffset = CGPoint(x: 0.0, y: 1.0)
        }
    }
    
    @objc func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        if let action = self.action {
            action()
        }
        
        return false
    }
}
