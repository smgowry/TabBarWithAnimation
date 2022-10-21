//
//  ViewController.swift
//  Sample
//
//  Created by Sammandhamoorthy, Gowrie [PBW-OT] on 10/20/22.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var labeltitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labeltitle.text = "One"
        self.view.backgroundColor = .systemGray
    }


}

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
    }


}

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray
    }


}
