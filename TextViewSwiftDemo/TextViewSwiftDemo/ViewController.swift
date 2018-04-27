//
//  ViewController.swift
//  TextViewSwiftDemo
//
//  Created by snowlu on 2017/6/30.
//  Copyright © 2017年 ZhunKuaiTechnology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let  textView = SLTextView(frame: CGRect.init(x: 100, y: 100, width: 121, height: 100) )
        
        textView.placeholder = "999"
         textView.placeholderColor = UIColor.red
        textView.font = UIFont.systemFont(ofSize: 18);
        textView.text = "------------";
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

