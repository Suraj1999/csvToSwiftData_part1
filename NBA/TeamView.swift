//
//  TeamView.swift
//  NBA
//
//  Created by Suraj Gupta on 03/04/24.
//

import SwiftUI

struct TeamView: View {
    var teams = loadCSV(from: "employee")
    var body: some View {
        List(teams) { team in
            Text("ID: \(team.empid), Name: \(team.name) Department: \(team.department) Salary: \(team.salary)")
        }
    }
}

#Preview {
    TeamView()
}
