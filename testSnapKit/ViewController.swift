//
//  ViewController.swift
//  testSnapKit
//
//  Created by DươngPQ on 02/06/2017.
//  Copyright © 2017 GMO-Z.com RunSystem. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var testView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func clearTestView() {
        if let view = testView {
            view.removeFromSuperview()
            testView = nil
        }
    }
    
    private func showButtons() {
        for view in self.view.subviews where view.isKind(of: UIButton.classForCoder()) {
            self.view.bringSubview(toFront: view)
        }
    }
    
    private func makeTestView() -> UIView {
        clearTestView()
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        self.testView = view
        showButtons()
        return view
    }
    
    @IBAction func centerButton_onTap(_ sender: UIButton) {
        let view = makeTestView()
        view.snp.makeConstraints { (maker) in
            maker.width.equalTo(50)
            maker.height.equalTo(50)
            maker.center.equalTo(view.superview!.snp.center)
        }
    }

    @IBAction func topLeftButton_onTap(_ sender: UIButton) {
        let view = makeTestView()
        view.snp.makeConstraints { (maker) in
            maker.width.equalTo(50)
            maker.height.equalTo(50)
            maker.left.equalTo(view.superview!).offset(10)
            maker.top.equalTo(view.superview!).offset(10)
        }
    }
    
    @IBAction func tlrButton_onTap(_ sender: UIButton) {
        let view = makeTestView()
        view.snp.makeConstraints { (maker) in
            maker.height.equalTo(50)
            maker.top.equalTo(view.superview!).offset(10)
            maker.left.equalTo(view.superview!).offset(10)
            maker.right.equalTo(view.superview!).offset(-10)
        }
    }
    
    @IBAction func tlbrButton_onTap(_ sender: UIButton) {
        let view = makeTestView()
        view.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.superview!).offset(10)
            maker.left.equalTo(view.superview!).offset(10)
            maker.bottom.equalTo(view.superview!).offset(-10)
            maker.right.equalTo(view.superview!).offset(-10)
        }
    }
    
    @IBAction func greaterButton_onTap(_ sender: UIButton) {
        clearTestView()
        let label = UILabel()
        self.testView = label
        label.backgroundColor = .red
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        self.view.addSubview(label)
        showButtons()
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(view.superview!).offset(10)
            maker.left.equalTo(view.superview!).offset(10)
            maker.right.equalTo(view.superview!).offset(-10)
            maker.height.greaterThanOrEqualTo(10)
        }
        label.text = "klasdf lisajflkasjfklsda asldjfdas sdaijfldasjfiodasjikf idasjfijiej oeiowe jioej oiwejioewjioe jufewiojefiojuewiojuewioewfiof io jioew jioew juioew oeiwui w uewewi ewofi jwfei ojfe woiwfe iwofeiwoffei woweoifjoeiw"
    }
    
}

