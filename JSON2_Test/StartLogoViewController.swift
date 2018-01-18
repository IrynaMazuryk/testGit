//
//  StartLogoViewController.swift
//  JSON2_Test
//
//  Created by Itcrystal Mac on 15.01.18.
//  Copyright © 2018 Ira. All rights reserved.
//

import UIKit

class StartLogoViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBOutlet weak var goBtn: UIButton!
    
    @IBOutlet weak var LogoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        goBtn.layer.cornerRadius = goBtn.frame.size.height / 2
        
        goBtn.layer.shadowOffset = CGSize (width: 9, height: 9)  // 1
        goBtn.layer.shadowOpacity = 0.7 // 2
        goBtn.layer.shadowRadius = 5 // 3
        goBtn.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor // 4
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
