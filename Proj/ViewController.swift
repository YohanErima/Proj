//
//  ViewController.swift
//  Proj
//
//  Created by etudiant on 21/10/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ButtonStart: UIButton!
    @IBOutlet weak var ButtonOption: UIButton!
    @IBOutlet weak var titre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titre.text=NSLocalizedString("Titre_Appli", comment: "Titre")
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

