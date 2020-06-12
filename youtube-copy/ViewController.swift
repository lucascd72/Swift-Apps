//
//  ViewController.swift
//  youtube-copy
//
//  Created by Lucas Danelon on 09/06/2020.
//  Copyright © 2020 Lucas Danelon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideo()
        
    }


}

