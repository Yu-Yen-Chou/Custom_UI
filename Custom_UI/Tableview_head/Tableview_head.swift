//
//  Tableview_head.swift
//  Custom_UI
//
//  Created by Yen on 2020/4/3.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit
public let KScreenWidth: CGFloat = UIScreen.main.bounds.size.width
private let navBarHeightPlusStatusHeight: CGFloat = 64.0
protocol PhotoTableViewControllerDelegate: class {
    func tableViewDidScroll(_ tableView: Tableview_head, translation: CGFloat,offsetY:CGFloat)
}

class Tableview_head: UIViewController {
//    lazy var topView: UIView = {
//           //底部的View
//           let topView = UIView()
//           topView.frame = CGRect.init(x: 0, y: 0, width: KScreenWidth, height: 200)
//           topView.backgroundColor = UIColor.yellow
//           //標題
//
//           return topView
//       }()
    
    @IBOutlet weak var top_V: top_view!
    weak var delegate: PhotoTableViewControllerDelegate?
    private let userInfoViewHeight: CGFloat = 200.0
   
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

          setupTableView()
         // self.view.addSubview(self.topView)
    }

    func setupTableView() {

       // self.tableView.backgroundColor = UIColor.orange

        self.tableView.delegate = self
        self.tableView.dataSource = self

        let nib = UINib(nibName: String(describing: Content_Cell.self), bundle: nil)

        self.tableView.register(nib, forCellReuseIdentifier: String(describing: Content_Cell.self))

        self.tableView.contentInset = UIEdgeInsets(top: userInfoViewHeight, left: 0, bottom: 0, right: 0)
    }
   
}
extension Tableview_head: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let Cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: Content_Cell.self),
            for: indexPath
            ) as! Content_Cell

       // Cell.title.text = String(indexPath.row)

        return Cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let offsetY = scrollView.contentOffset.y
        
        let translation = scrollView.contentOffset.y + userInfoViewHeight
      //  let radius = -offsetY/200
    //    self.delegate?.tableViewDidScroll(self, translation: translation,offsetY:offsetY)
     if -offsetY > 50
     {
    
            self.top_V.frame = CGRect(x:0, y: navBarHeightPlusStatusHeight - translation, width: KScreenWidth, height: 200)
        
     }
     else{
  
                      
     }
            

            
            
    
    }
}
