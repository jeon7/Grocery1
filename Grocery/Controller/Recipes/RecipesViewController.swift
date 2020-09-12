//
//  ViewController.swift
//  Grocery
//
//  Created by Gukhwa Jeon on 10.09.20.
//

import UIKit


class RecipesViewController: UIViewController, SideMenuDelegate {
    
    @IBOutlet weak var menuContainerLeading: NSLayoutConstraint!
    @IBOutlet weak var contentContainerLeading: NSLayoutConstraint!
    
    var isSideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // viewDidLoad()에서 스토리보드의 뷰컨트롤러를 인스턴스화한 후 델리게이트 설정했는데 안됐음.
        if (segue.identifier == Storyboard.CONTENT_TABLE_VC_SEGUE) {
            let contentVC = segue.destination as! ContentTableViewController
            contentVC.sideMenuDelegate = self
        }
    }
    
    func toggleSideMenu() {
        print("toggleSideMenu()")
        if isSideMenuOpen {
            menuContainerLeading.constant = -240
            isSideMenuOpen = false
        } else {
            menuContainerLeading.constant = 0
            isSideMenuOpen = true
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

