//
//  Top_Collection.swift
//  bti
//
//  Created by Yen on 2020/4/2.
//  Copyright © 2020 Yen. All rights reserved.
//

import UIKit
import Foundation

class Top_Collection: UIView {

    var slider = UIView()
    @IBOutlet var ContentView: UIView!
    @IBOutlet weak var c_view: UICollectionView!
    var dateArr = ["滾球","即將開始","早盤","最愛","優勝","2/19(三)","2/20(四)","2/20(四)","2/20(四)","2/20(四)"]
    public var select_date = [Int:Int]()
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
           Bundle.main.loadNibNamed("Top_Collection", owner: self, options: nil)
           addSubview(ContentView)
           ContentView.frame = self.bounds
           ContentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
           // ContentView.translatesAutoresizingMaskIntoConstraints = true
            
            Collectionview_init()
            
       }
    private func Collectionview_init()
    {
       
// UICollectionViewFlowLayout
        
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       c_view.collectionViewLayout = layout
        
// UICollectionView register
               
        let C_Nib = UINib(nibName: String(describing: Top_Cell.self), bundle: nil)
        c_view.register(C_Nib, forCellWithReuseIdentifier: String(describing: Top_Cell.self))
        
        c_view.delegate = self
        c_view.dataSource = self
        c_view.showsHorizontalScrollIndicator = false
        
// UICollectionView slider
        slider.backgroundColor = .orange
        slider.center.y = 42
        c_view.addSubview(slider)
        
// UICollectionView didSelect[section,row]
        
        collectionView(c_view, didSelectItemAt: [0,0])
     
       
    }
   
// dynamic text
    func textSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
}
// MARK: -  UICollectionView Delegate,DataSource
extension Top_Collection:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return dateArr.count
         }

      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
      {
          let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Top_Cell.self), for: indexPath) as! Top_Cell
    
          if(select_date[indexPath.row] == 1)
          {
            Cell.title.textColor = .orange
          }
          else
          {
            Cell.title.textColor  = .white
          }
          Cell.title.text = dateArr[indexPath.row]
          return Cell
      }
// dynamic
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
           select_date.removeAll()
           select_date[indexPath.row] = 1
   
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Top_Cell.self), for: indexPath) as! Top_Cell
        collectionView.scrollToItem(at:indexPath,at:.centeredHorizontally,animated:true)
       let textFont = UIFont.systemFont(ofSize: 17)
       let textString = self.dateArr[indexPath.item]
       let textMaxSize = CGSize(width: 240, height: CGFloat(MAXFLOAT))
       let textLabelSize = self.textSize(text:textString , font: textFont, maxSize: textMaxSize)
        self.slider.frame.size = CGSize(width:textLabelSize.width,height:3)
       
        UIView.animate(withDuration:0.4){[weak self] in
            guard let self = self else { return}
            self.slider.center.x = Cell.center.x
           
            self.c_view.reloadData()
        }

        
      }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        var cellSize = CGSize()
        let textFont = UIFont.systemFont(ofSize: 17)
        let textString = dateArr[indexPath.item]
        let textMaxSize = CGSize(width: 240, height: CGFloat(MAXFLOAT))
        let textLabelSize = self.textSize(text:textString , font: textFont, maxSize: textMaxSize)
        
        //+10 是右方icon寬度 + 其他設定
        cellSize.width = textLabelSize.width + 10

  
        //高度固定
        cellSize.height = 45
        return cellSize
    }
    
    
}

