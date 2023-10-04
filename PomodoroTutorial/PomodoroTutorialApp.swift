//
//  PomodoroTutorialApp.swift
//  PomodoroTutorial
//
//  Created by Mia on 4/10/2023.
//

import SwiftUI

@main
struct PomodoroTutorialApp: App {
    // MARK: Sinve We're doing background fetching intializing here
    @StateObject var pomodoroModel: PomodoroModel = .init()
    
    // MARK: Scene Phase
    @Environment(\.scenePhase) var phase
    
    // MARK: Stoing Last Time Stamp
    @State var lastActiveTimeStamp: Date = Date()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: phase) { newValue in
            if newValue == .background {
                lastActiveTimeStamp = Date()
            }
            
            if newValue == .active {
                // MARK: Finding The Difference
                let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                if pomodoroModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                    pomodoroModel.isStarted = false
                    pomodoroModel.totalSeconds = 0
                    pomodoroModel.isFinished = true
                } else {
                    pomodoroModel.totalSeconds -= Int(currentTimeStampDiff)
                }
            }
        }
    }
}
