 //
//  SLTextView.swift
//  TextViewSwiftDemo
//
//  Created by snowlu on 2017/6/30.
//  Copyright © 2017年 ZhunKuaiTechnology. All rights reserved.
//

import UIKit

 @IBDesignable class SLTextView: UITextView {

   @IBInspectable   public var placeholder:NSString?
    
    @IBInspectable public var placeholderColor:UIColor? = UIColor.black
    
    @IBInspectable public var  placeholderFont:UIFont? = UIFont.systemFont(ofSize: 14);
    
    @IBInspectable public var cornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius;
            self.layer.masksToBounds = true;
        }
    };
    
    override  var text: String! {
        didSet{
          self.setNeedsDisplay()
        }
    }
    override var font: UIFont? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    override init(frame: CGRect, textContainer: NSTextContainer?) {
      super.init(frame: frame, textContainer: textContainer)
        self.addNotificationCenter();
    }
    
    @objc func textDidChange(){
      self.delegate?.textViewDidChange!(self)
       self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        guard !self.hasText else {
           
    
            return
        }
       let attrs = NSMutableDictionary.init()
        
        attrs.setValue(self.font, forKey: NSFontAttributeName)

        attrs.setValue(self.placeholderColor, forKey: NSForegroundColorAttributeName)
        
        let x:CGFloat  = 8.0
        
        let  y:CGFloat  = 8.0
        
        let widht  = rect.size.width - 2 * x
        
        let height  = rect.size.height  - 2 * y
        
        let tempRect = CGRect.init(x: x, y: y, width:widht, height: height)
        
        self.placeholder?.draw(in: tempRect, withAttributes:attrs as? [String : Any])
    
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.addNotificationCenter();
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
 fileprivate extension SLTextView{
    func addNotificationCenter() {
         NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: .UITextViewTextDidChange, object: self)
    }
    
 }

