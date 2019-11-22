//
//  ViewController.swift
//  Proj
//
//  Created by etudiant on 21/10/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {

    var player : AVAudioPlayer!
    @IBOutlet weak var ButtonStart: UIButton!
    @IBOutlet weak var ButtonOption: UIButton!
    @IBOutlet weak var titre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        let audioFileURL = Bundle.main.url(forResource: "All-is-fine", withExtension: "mp3")  // importation de la musique de font
               do {
                   let sound = try AVAudioPlayer(contentsOf: audioFileURL!) //récupération de l'url de la musique
                   player = sound
                player.play() //  lancement de la musique
               } catch {
                   // couldn't load file :(
               }
        titre.text=NSLocalizedString("Titre_Appli", comment: "Titre")
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

