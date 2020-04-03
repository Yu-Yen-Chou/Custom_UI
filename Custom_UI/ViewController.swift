//
//  ViewController.swift
//  Custom_UI
//
//  Created by Yen on 2020/4/2.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func go_head(_ sender: Any) {
        let test = Tableview_head()
        self.navigationController?.pushViewController(test, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

