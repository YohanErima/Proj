//
//  JSONParser.swift
//  Proj
//
//  Created by Fabien HOARAU on 11/21/19.
//  Copyright © 2019 etudiant. All rights reserved.
//

import Foundation
import CoreLocation

class JSONParser{
    var TabEnigme:[Any]!
    func JSONParser()->[Any]?{
        guard let path = Bundle.main.path(forResource : "filename",ofType: "json") else {return []}
        let url = URL(fileURLWithPath : path)
        
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            guard let array = json as? [Any] else {
                return nil
            }
            
            TabEnigme = array
        
            
        
        }catch {
            print("error")
        }
        return TabEnigme
    }
    
    func getDialog(Key: String)->[Any]?{
        var dialog: [Any] = []
        
            for enigme in TabEnigme {
                
                guard let enigmeDict = enigme as? [String: Any] else {return nil}
                guard let enigmeName = enigmeDict["name"] as? String else {return nil }
                if (enigmeName == Key){
                    dialog = [enigme]
                }
            
                
            }
       
        return dialog
        
    }
    
    func readDialog(file: [Any])-> [String]? {
        var dialog : [String] = []
        
        for i in file{
            guard let enigmeDict = i as? String else {return nil}
            dialog.append(enigmeDict)
        }
        return dialog
    }
    
    
    /*func getLatLng(file: [Any])->[CLLocationCoordinate2D]{
        var latitude,longitude: Double
        
        latitude = file.latitude
        longitude = file.longitude
        
        
    }*/
    
    func getCoordonate(Key : String)-> [Any]?{
        var dialog: [Any] = []
        
            for enigme in TabEnigme {
                
                guard let enigmeDict = enigme as? [String: Any] else {return nil}
                guard let enigmeName = enigmeDict["name"] as? String else {return nil }
                guard let enigmeTargat = enigmeDict["target"] as? String else {return nil }
                
                if (enigmeName == Key){
                    dialog = [enigmeTargat]
                }
            
                
            }
        
        return dialog
        
    }
    
    /*func getInt(Key : String)-> Int?{
        var num : Int
        
        for enigme in TabEnigme {
        
            guard let enigmeDict = enigme as? [String: Any] else {return nil}
            guard let enigmeName = enigmeDict["name"] as? String else {return nil }
        
        if (enigmeName == Key){
            if (enigmeDict["name"]){
                
            }
            num =
        }
        
        
        
        }
    }*/
    
    /*func getString(Key : String)-> String?{
        var chaine : Int
        
        for enigme in TabEnigme {
        
            guard let enigmeDict = enigme as? [String: Any] else {return nil}
            guard let enigmeName = enigmeDict["name"] as? String else {return nil }
        
        if (enigmeName == Key){
            if (enigmeDict["name"]){
                
            }
            chaine =
        }
        
        
        
        }
    }*/
    
    
    
    
}
