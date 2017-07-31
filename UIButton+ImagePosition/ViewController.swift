//
//  ViewController.swift
//  UIButton+ImagePosition
//
//  Created by YJM on 2017/7/31.
//  Copyright © 2017年 YJM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn:UIButton = UIButton(type: .custom)
        btn.setImage(UIImage(named: "cg"), for: .normal)
        btn.setTitle("test", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.frame = CGRect(x: 10, y: 10, width: 200, height: 200)
        btn .setImagePosition(position: .bottom, spacing: 50)
        self.view.addSubview(btn)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

