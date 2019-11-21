//
//  Enigme.swift
//  Proj
//
//  Created by etudiant on 12/11/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import Foundation
import CoreLocation

class Egnime{
    var nbChapter:Int!
    var currentChapter:Int!
    var chapterFinish:Int!
    var radius: Int!
    var currentDialog:Int!
    var chapterDialog: [String]!
    var help: [String]!
    var target:CLLocationCoordinate2D!
    var file: String!
    
    func Egnime(file:String){
        
        self.file = file;
        //JSonParser jsonFile = newJSONParser(file)
        
        
        
        currentChapter = 1
        chapterFinish = 0
        currentChapter = 0
        
    }
    
    func getNbChapter()-> Int {
        return nbChapter!
    }
    func getCurrentChapter() -> Int{
        return currentChapter!
    }


    func getChapterDialog() ->[String]{
        return chapterDialog!
    }

    func getHelp()->[String] {
        return help!
    }


    func getTarget()-> CLLocationCoordinate2D {
        return target!
    }

    func getRadius()->Int {
        return radius!
    }

   func isWin()-> Bool{
        return !(chapterFinish<nbChapter)
    }

    func nextChapter(){

        /*JSONParser jsonFile = new JSONParser(file);

            try {

                chapterDialog = jsonFile.getDialog("Dialog_Chapter_"+currentChapter);
                help = jsonFile.getDialog("Help_Chapter_"+currentChapter);
                target = jsonFile.getCoordinate("Target_Chapter_"+currentChapter);
                radius = jsonFile.getInt("Radius_Chapter_"+currentChapter);

            } catch (IOException e) {
                e.printStackTrace();
            }*/
    }

    func nextStep(){

        currentChapter = currentChapter!+1 ;
        chapterFinish = chapterFinish!+1;

        if(!isWin()){
            nextChapter();
        }
    }

    func getAllDialog()-> String{

        var allDialog:String = ""
        var i = 0

        while i<currentDialog!{

            allDialog = allDialog+chapterDialog[i]+"\n\n"
            i += 1

        }

        return allDialog;
    }
    
}
