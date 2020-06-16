//
//  ExportFile.swift
//  ContextDetectionWithNEAT
//
//  Created by Christian Baltzer on 11.05.20.
//  Copyright © 2020 Christian Baltzer. All rights reserved.
//

import Foundation
import CSV

func ExportCSV(Data: [[Double]], Auswahl:[[Double]]){
    var ErgebnisString = "input, Auswahl \n "
    
    for i in Range(0...Data.count-1){
        var Input = ""
        var insert = ""
        for t in Data[i]{
            Input.append(String(t))
            Input.append("-")
        }
        for t in Auswahl[i]{
            insert.append(String(t))
            insert.append("-")
        }
        ErgebnisString.append(Input + "," + insert + " \n ")
    }
    let filename = getDocumentsDirectory().appendingPathComponent("output.csv")
    do {
        print(filename.absoluteURL)
        try ErgebnisString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        print("Error")
        print(error)
        // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
