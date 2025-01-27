//
//  SettingsView.swift
//  Recipe
//
//  Created by Łukasz Adamczak on 27/01/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var hideOptionalStep: Bool = false
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView {
            Form {
                ColorPicker("List BackgroundColor", selection: $listBackgroundColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor)
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Hidden Optional Steps", isOn: $hideOptionalStep)
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
