//
//  FirstViewController.swift
//  TransformAnimationDemo
//
//  Created by lokizero00 on 2017/10/12.
//  Copyright © 2017年 lokizero00. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var buttonTranatate:UIButton?
    @IBOutlet weak var buttonRotate:UIButton?
    @IBOutlet weak var buttonScale:UIButton?
    @IBOutlet weak var buttonInvert:UIButton?
    @IBOutlet weak var redView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title="首页"
        self.view.backgroundColor=UIColor.white
        
        buttonTranatate?.addTarget(self, action: #selector(self.caTranatate), for: .touchUpInside)
        buttonRotate?.addTarget(self, action: #selector(self.caRotate), for: .touchUpInside)
        buttonScale?.addTarget(self, action: #selector(self.caScale), for: .touchUpInside)
        buttonInvert?.addTarget(self, action: #selector(self.caInvert), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //CATransition 动画-平移
    @objc func caTranatate(){
        UIView.beginAnimations("caTranatate", context: nil)
        UIView.setAnimationDuration(2.0)
        //每次都是从当前位置平移，支持链式调用
        self.redView?.transform=(self.redView?.transform.translatedBy(x: -20.0, y: -20.0))!
        UIView.commitAnimations()
    }
    
    //CATransition 动画-旋转
    @objc func caRotate(){
        UIView.beginAnimations("caRotate", context: nil)
        UIView.setAnimationDuration(2.0)
        self.redView?.transform=(self.redView?.transform.rotated(by: CGFloat(-Double.pi/2)))!
        UIView.commitAnimations()
    }
    
    //CATransition 动画-缩放
    @objc func caScale(){
        UIView.beginAnimations("caScale", context: nil)
        UIView.setAnimationDuration(2.0)
        self.redView?.transform=(self.redView?.transform.scaledBy(x: 1.5, y: 1.5))!
        UIView.commitAnimations()
    }
    
    //CATransition 动画-反转到某个状态
    @objc func caInvert(){
        UIView.beginAnimations("caInvert", context: nil)
        UIView.setAnimationDuration(2.0)
//       self.redView?.transform=(self.redView?.transform.inverted())!    //独立反转，以初始位置反转
        self.redView?.transform=(self.redView?.transform.concatenating((self.redView?.transform.inverted())!))!       //连续反转
        UIView.commitAnimations()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
