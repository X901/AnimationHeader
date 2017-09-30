
//  ViewController.swift
//  AnimationHeader
//
//  Created by X901 on 9/19/17.
//  Copyright © 2017 Basil Baragabah. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var bigStackView: UIStackView!
    
    @IBOutlet weak var StackView: UIStackView!
    
    @IBOutlet weak var StackViewHight: NSLayoutConstraint!
    
    
    @IBOutlet weak var progileHight: NSLayoutConstraint!
    
    
    @IBOutlet weak var profileWidth: NSLayoutConstraint!
    
    
    
    var rowsNames = ["Row 0", "Row 1", "Row 2", "Row 3", "Row 4", "Row 5",
                     "Row 6", "Row 7", "Row 8", "Row 9", "Row 10", "Row 11",
                     "Row 12", "Row 13", "Row 14", "Row 15", "Row 16", "Row 17",
                     "Row 18", "Row 19", "Row 20", "Row 21", "Row 22", "Row 23",
                     "Row 24", "Row 25", "Row 26", "Row 27", "Row 28", "Row 29", "Row 20"]
    
    
    
    
    // we set a variable to hold the contentOffSet before scroll view scrolls
    var lastContentOffset: CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: - UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = rowsNames[indexPath.row]
        
        return cell
    }
    
    
    
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            // moved to top
            
            
            UIView.animate(withDuration: 0.5,
                           animations: {
                            
                            
                            // Change Hight and Witdh of profileImage (make it smaller)
                            
                            self.progileHight.constant = 45
                            self.profileWidth.constant = 45
                            
                            self.bigStackView.axis = .horizontal
                            
                            self.StackView.axis = .horizontal
                            
                            // Change spacing from profileImage and nameLable
                            self.StackView.spacing = 15
                            
                            // Make BigStackView Smaller
                            self.StackViewHight.constant = 60
                            
                            
                            
                            self.view.layoutIfNeeded()
                            
            })
            
            
            
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            // moved to bottom
            
            //-
            
            
            UIView.animate(withDuration: 0.5,
                           animations: {
                            
                            
                            // return Hight and Witdh of profileImage to its orginal size
                            
                            self.progileHight.constant = 100
                            self.profileWidth.constant = 100
                            
                            
                            self.bigStackView.axis = .vertical
                            
                            self.StackView.axis = .vertical
                            
                            // return spacing from profileImage and nameLable to the orginal space
                            self.StackView.spacing = 5
                            
                            // return BigStackView to its orginal size
                            self.StackViewHight.constant = 160
                            
                            
                            self.view.layoutIfNeeded()
                            
            })
            
        } else {
            // didn't move
        }
    }
    
    
    
    
    
    
    
}



