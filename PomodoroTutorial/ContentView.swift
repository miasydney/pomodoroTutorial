//
//  ContentView.swift
//  PomodoroTutorial
//
//  Created by Mia on 4/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pomodoroModel: PomodoroModel
    
    var body: some View {
        Home()
            .environmentObject(pomodoroModel)
        }
    
    }


#Preview {
    ContentView()
}
