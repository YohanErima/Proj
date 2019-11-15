//
//  PhotoViewController.swift
//  Proj
//
//  Created by etudiant on 11/15/19.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var PhotoView: UIImageView!
    @IBOutlet weak var boutonP: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func choisi(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let fiche = UIAlertController(title:  NSLocalizedString("Source_photo", comment: "Photo"), message: NSLocalizedString("choisissez où tu veux prendre la photo", comment: "Photo"), preferredStyle: .actionSheet)
        fiche.addAction(UIAlertAction(title: NSLocalizedString("appareil photo", comment: "actionsheet"), style: .default, handler: {(action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {

                imagePickerController.sourceType = .camera
                self.present(imagePickerController,animated: true,completion: nil)
                
            }else {
                print(NSLocalizedString("soit ta camera est cassée ou soit tu fais sur un émulateur donc tu n'as pas acces à la caméra ", comment: "actionsheet"))
            }
            
        }))
        
        fiche.addAction(UIAlertAction(title:  NSLocalizedString("galerie", comment: "actionsheet"), style: .default, handler: {(action:UIAlertAction)in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true,completion: nil)
        }))
        
        fiche.addAction(UIAlertAction(title: NSLocalizedString("annuler", comment: "actionsheet"), style: .default, handler: nil))
        
        self.present(fiche, animated: true, completion: nil)


    
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image=info[UIImagePickerControllerOriginalImage] as! UIImage
        
        PhotoView.image = image
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
