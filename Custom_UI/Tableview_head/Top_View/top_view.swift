//
//  top_view.swift
//  Custom_UI
//
//  Created by Yen on 2020/4/3.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit

class top_view: UIView {

    @IBOutlet var ContentView: UIView!
    override init(frame: CGRect) {
             super.init(frame: frame)
             setup()
         }
         
         required init?(coder aDecoder: NSCoder) {
             super.init(coder: aDecoder)
             setup()
         }
    
      private func setup()
      {
          Bundle.main.loadNibNamed("top_view", owner: self, options: nil)
          addSubview(ContentView)
          ContentView.frame = self.bounds
          ContentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
          // ContentView.translatesAutoresizingMaskIntoConstraints = true
           
         
           
      }

}
