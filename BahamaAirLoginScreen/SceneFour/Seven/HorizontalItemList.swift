

import UIKit

//
// A scroll view, which loads all 10 images, and has a callback
// for when the user taps on one of the images
//
class HorizontalItemList: UIScrollView {
  
  var didSelectItem: ((_ index: Int)->())?  // 一级公民， 函数是
  
  let buttonWidth: CGFloat = 60.0
  let padding: CGFloat = 10.0
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init(inView: UIView) {
    let rect = CGRect(x: inView.bounds.width, y: 120.0, width: inView.frame.width, height: 80.0)
    /*  x: inView.bounds.width
    
        X 坐标， 动画 处理
     */
    self.init(frame: rect)
    
    alpha = 0.0
    
    for i in 0 ..< 10 {
      let image = UIImage(named: "summericons_100px_0\(i).png")
      let imageView  = UIImageView(image: image)
      imageView.center = CGPoint(x: CGFloat(i) * buttonWidth + buttonWidth/2, y: buttonWidth/2)
      imageView.tag = i
      imageView.isUserInteractionEnabled = true
      addSubview(imageView)
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(HorizontalItemList.didTapImage(_:)))
      imageView.addGestureRecognizer(tap)
    }
    
    contentSize = CGSize(width: padding * buttonWidth, height:  buttonWidth + 2*padding)
  }
  
    
    
  @objc func didTapImage(_ tap: UITapGestureRecognizer) {
    didSelectItem?(tap.view!.tag)
  }
  
    
    
    
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    guard superview != nil else {
      return
    }
    
    UIView.animate(withDuration: 1.0, delay: 0.01, usingSpringWithDamping: 0.5,
      initialSpringVelocity: 10.0, options: .curveEaseIn,
      animations: {
        self.alpha = 1.0
        self.center.x -= self.frame.size.width
      },
      completion: nil
    )
  }
}


/*
 
 Note: This chapter won’t cover HorizontalItemList in detail; its implementation isn’t relevant to creating animations. However, you’re still welcome to peek into HorizontalItemList.swift if you want to see how it works!
 
 */
