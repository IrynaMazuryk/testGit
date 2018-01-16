//
//  DetailViewController.swift
//  JSON2_Test
//
//  Created by Itcrystal Mac on 05.12.17.
//  Copyright © 2017 Ira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


        
        
        @IBOutlet weak var first: UILabel!
        @IBOutlet weak var last: UILabel!
        
        @IBOutlet weak var created: UILabel!
        @IBOutlet weak var balance: UILabel!
        
        @IBOutlet weak var address: UILabel!
        @IBOutlet weak var email: UILabel!
        
        var components :Components?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            first.text = components?.first
            last.text = components?.last
            created.text = components?.created
            balance.text = components?.balance
            address.text = components?.address
            email.text = components?.email
            
        }
        
        
        
    }


