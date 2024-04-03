//
//  DataFactory.swift
//  NBA
//
//  Created by Suraj Gupta on 03/04/24.
//

import Foundation

struct Employee: Identifiable {
    var empid: String
    var name: String
    var department: String
    var salary: String
    var id = UUID()
    
    init(raw: [String]) {
        empid = raw[0]
        name = raw[1]
        department = raw[2]
        salary = raw[3]
    }
}

func loadCSV(from csvName: String) -> [Employee] {
    
    var empToStruct = [Employee]()
    
    // locate file path
    guard let file = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    // convert the contents of file into one very long string
    var longStr = ""
    do {
        longStr = try String(contentsOfFile: file)
    } catch {
        print(error.localizedDescription)
        return []
    }
    
    // Split the long string into array of "rows" of data. Each row is string
    //detect "\n" carriage return and split so that it divides it into rows
    
    var rows = longStr.components(separatedBy: "\n")
     
    //remove the first row which is a header row not required
    rows.removeFirst()
    
    // now loop around each row and split it into coloumns
    
    for row in rows {
        
        let csvColoumn = row.components(separatedBy: ",")
        let colToStruct = Employee(raw: csvColoumn)
        empToStruct.append(colToStruct)
        
    }
    
    return empToStruct
}
